var port = 8000,
    host = "127.0.0.1",
    http = require("http"),
    client = require("socket.io").listen(port).sockets,
    mysql = require("mysql"),
    formadible = require("formidable"),
    con = mysql.createConnection({ user:"root", password: "", host:host, database:"node_js_chat" });




con.connect((err)=> {

  if (err) throw err;

  client.on("connection",(socket)=>{
      
 
	  var USERTABLE = "CREATE TABLE IF NOT EXISTS users ( id int PRIMARY KEY AUTO_INCREMENT, username VARCHAR(2000) NOT NULL, useremail VARCHAR(2000) NOT NULL, userpass VARCHAR(2000) NOT NULL )";
	  var MESSAGES = "CREATE TABLE IF NOT EXISTS messages ( mess_id int PRIMARY KEY AUTO_INCREMENT, mess_from int, mess_to int, mess_txt VARCHAR(20000), mess_time VARCHAR(1000), FOREIGN KEY (mess_from) REFERENCES users(id),FOREIGN KEY (mess_to) REFERENCES users(id) )";
	  con.query(USERTABLE,(err)=>{ if(err) throw err;  });
	  con.query(MESSAGES,(err)=>{ if(err) throw err; });

	  var formValidity = (s)=>{ socket.emit("validate",s); }
     
	  socket.on('signup-submit',(data)=>{
	  	 if(data.sn_un  != '' && data.sn_em != '' && data.sn_ps != '' && data.sn_psr != '' ){
             var CHECK_VALIDITY = "SELECT * FROM users WHERE username = '"+data.sn_un+"' OR useremail = '"+data.sn_em+"' ";
             con.query(CHECK_VALIDITY,(er,res)=>{
             	if(er) throw er;
                if(res.length>0){
                	formValidity("Username Or Email already exists"); 
                } else{
                	var INSERT_USER = "INSERT INTO users VALUES(NULL,'"+data.sn_un+"','"+data.sn_em+"','"+data.sn_ps+"',0,'default')";
			  	 	 con.query(INSERT_USER,(err)=>{
			  	 	 	if(err) throw err;
			  	 	 	formValidity("Data Inserted"); 
			  	 	 })
                }
             });
	  	 } else{
	  	 	formValidity("Fields Required"); 
	  	 }
	  })


	  socket.on('login-submit',(data)=>{
	  	if(data.lg_em != '' && data.lg_ps != '' ){
             var LOGIN_USER = "SELECT * FROM users WHERE useremail = '"+data.lg_em+"'  AND userpass = '"+data.lg_ps+"'";
	  	 	 con.query(LOGIN_USER,(err,result)=>{
	  	 	 	if(err) throw err;
	  	 	 	if(result.length>0){
	  	 	 		var UPDATE_USER_SESSION = "UPDATE users SET user_session = 1  WHERE useremail = '"+data.lg_em+"'";
	  	 	 		con.query(UPDATE_USER_SESSION,(er,res)=>{
	  	 	 			 if (er) throw er;
                         var GET_USER_DATA = "SELECT * FROM users WHERE useremail = '"+data.lg_em+"'  AND userpass = '"+data.lg_ps+"'";
                         con.query(GET_USER_DATA,(e,r)=>{
		  	 	 			 if (e) throw e;
                             formValidity("Valid User");
		  	 	 		     socket.emit("login_success",r); 
                         });
	  	 	 		});
	  	 	 	} else{
	  	 	 		formValidity("Invalid User");
	  	 	 	}
	  	 	 })
	  	}else{
	  		formValidity("Fields Required"); 
	  	}
	  })

      socket.on('update_logout',(data)=>{
         var LOGOUT_USER = "UPDATE users SET user_session = 0  WHERE id = '"+data.user+"'";
	 		con.query(LOGOUT_USER,(er,res)=>{
	 			 if (er) throw er;
		         socket.emit("logout_success");
			});
      });


  	  socket.on("user_messages",(data)=>{
          console.log(data);
  		  var GET_USER_NAMES = "select * from ( select mess_to as user_id from messages where mess_from = '"+data+"' union select mess_from as user_id from messages where mess_to = '"+data+"' ) sub join users on users.id = sub.user_id";
		  con.query(GET_USER_NAMES,(err,res)=>{
			  if(err) throw err;
              
              var last_data = [],last_time,last_text,COUNT = 0;
			  for(var i = 0 ;i<res.length;i++){

				  var GET_LASTMESS_AND_TIME = "SELECT username,mess_txt,mess_time FROM (select mess_to as user_id,mess_txt,mess_id,mess_time from messages where mess_from = '"+res[i].id+"' AND mess_to='"+data+"' UNION select mess_to as user_id,mess_txt,mess_id,mess_time from messages where mess_from = '"+data+"' AND mess_to='"+res[i].id+"' ORDER BY mess_id ASC) sq join users on users.id = sq.user_id";
				  
				  con.query(GET_LASTMESS_AND_TIME,(e,r)=>{
					 if(e) throw e;
					 var len=r.length;
                     if(len>0){
						 last_time = r[len-1].mess_time;
						 last_text = r[len-1].mess_txt;
						 active_user = data;
						 last_data.push({date:last_time,text:last_text});
					 } 
				    });
			    }
	              
	            setTimeout(()=>{	
		            socket.emit("user_messages_list",{result:res,last_data:last_data,active_user:active_user});
		            COUNT = res.length;
		        },1000);  
			    
		    });

  	    });
      
      var CURRENT_LENGTH=0,USER;
       socket.on("get_user_messages",(data)=>{

       	  USER = data.clicked;

  		  var GET_CLICKED_USER_MESS = "SELECT mess_txt,mess_time,mess_to FROM (select mess_to as user_id,mess_txt,mess_time,mess_id,mess_to from messages where mess_from = '"+data.active+"' AND mess_to='"+data.clicked+"' UNION select mess_to as user_id,mess_txt,mess_time,mess_id,mess_to from messages where mess_from = '"+data.clicked+"' AND mess_to='"+data.active+"') sq join users on users.id = sq.user_id ORDER BY mess_id ASC";
         
          con.query(GET_CLICKED_USER_MESS,(err,res)=>{
             if(err) throw err;

             if(res.length > CURRENT_LENGTH && USER == data.clicked){
	             socket.emit("get_ret_messages",res);
	             CURRENT_LENGTH = res.length;
	         }
	         else if(res.length > CURRENT_LENGTH || res.length < CURRENT_LENGTH && USER == data.clicked){
                 socket.emit("get_ret_messages",res);
	             CURRENT_LENGTH = res.length;
	       	     USER = data.clicked;
	         }
          })
       });


       socket.on("textarea_input",(data)=>{

       	    var d = new Date(),
			date = d.toDateString();
			function formatAMPM(date) {
			  var hours = date.getHours();
			  var minutes = date.getMinutes();
			  var ampm = hours >= 12 ? 'PM' : 'AM';
			  hours = hours % 12;
			  hours = hours ? hours : 12; // the hour '0' should be '12'
			  hours = hours < 10 ? '0'+hours : hours;
			  minutes = minutes < 10 ? '0'+minutes : minutes;
			  var strTime = hours + ':' + minutes + ' ' + ampm;
			  return strTime;
			}

			var datetime = 'On ' + date + ' at ' + formatAMPM(d);

           var INSERT_NEW_TEXT = "INSERT INTO messages VALUES (NULL,'"+ data.from +"','"+ data.to +"','"+ data.text +"','"+ datetime +"')";

           con.query(INSERT_NEW_TEXT,(e)=>{
           	if(e) throw e;
	          socket.emit("play_sound",{res:data,date:datetime});
           })
       });


       socket.on("user_image",(data)=>{
          

          
	        // Process the data here
	       	

       })






    })


      
});



