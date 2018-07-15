/*
  
  =======================================================================================================
  ========================================== SOCKET PROGRAMMING =========================================
  =======================================================================================================

*/

(()=>{

var _c = (el)=>{ return document.querySelector(el); };

try{ var socket = io.connect("http://127.0.0.1:8000"); } //Connection with Socket
catch(e){}

if(socket !== undefined){ 
    


    

    /*SIGN UP FORM DATA*/
  _c('.signup_form').addEventListener('submit',(e)=>{ 
    
    e.preventDefault();
    let s = $('.signup_form').serializeArray(),

      objectify = (s)=>{
        let result = {};
        for (let i = 0; i < s.length; i++){ result[ s[i]['name'] ] = s[i]['value']; }
        return result;
      };

        socket.emit('signup-submit',objectify(s));
        socket.on("validate",(s)=>{
          switch(s.toLowerCase()){
            case "data inserted":{
              _c('.signup_form').reset();
              document.getElementById('signup_form').style.display='none';
              _c('.user_welcome_mess').style.display='block';
              setTimeout(()=>{
                 _c('.user_welcome_mess').style.display='none';
                 document.getElementById('login_form').style.display='block';
              },2000);
              break;
            }
            case "username or email already exists":{
              _c('.errorMessage').style.display='block';
              _c('.errorMessage span').textContent = s + ' !';
              break;
            }
            case "fields required":{
              _c('.errorMessage').style.display='block';
              _c('.errorMessage span').textContent = s + ' !';
              break;
            }
          }
        });
  });

  /*SIGN UP FORM DATA*/

  var ME,USER,CLICKED = false,LOGIN = false;

    (()=>{
      if (document.cookie.indexOf("_session") >= 0) {
          $('.auth_container').hide();
          $('.chat-wrap').show();
          socket.emit("user_messages",$.cookie('_user'));
      }
    })();  

   _c('.login_form').addEventListener('submit',(e)=>{
      e.preventDefault();
      let s =  $('.login_form').serializeArray();

      objectify = (s)=>{
      let result = {};
      for (let i = 0; i < s.length; i++){ result[ s[i]['name'] ] = s[i]['value']; }
      return result;
    };

    socket.emit('login-submit',objectify(s));

      socket.on("validate",(s)=>{
        switch(s.toLowerCase()){
          case "valid user":{
            _c('.login_form').reset();
            $('.auth_container').hide();
            $('.chat-wrap').show();
            $.cookie('_session',true,{expires:3});
            LOGIN = true;
            break;
          }
          case "fields required":{
                _c('.errorMessage2').style.display='block';
                _c('.errorMessage2 span').textContent = s + ' !';
            break;
          }
          case "invalid user":{
            _c('.errorMessage2').style.display='block';
            _c('.errorMessage2 span').textContent = s + ' !';
            break;
          }
        }
      });
      });//Login Submit End  

      socket.on("login_success",(data)=>{
        
        socket.emit("user_messages",data[0].id);
        $.cookie('_user',data[0].id);
        _c(".user-profile-name span").textContent = data[0].username;

        socket.emit("user_zero_messages",()=>{
          alert("user_zero_messages");
        });

      }); 

    socket.on("user_messages_list",(data)=>{
        
        var left_tab = document.getElementsByClassName("users-list")[0],user;

        while (left_tab.hasChildNodes()) { left_tab.removeChild(left_tab.firstChild); }

        for(var i = 0;i<data.result.length;i++){

           if(data.result[i].user_session===1){
               user = '<div class="ind-user left" data-id='+data.result[i].id+'><span class="ind-user-st"><i class="fa fa-circle green"></i></span><div class="ind-user-image left z-depth-2"> <img src="me.jpg"> </div><div class="ind-user-name left">'+data.result[i].username+'</div><div class="ind-user-text left">'+data.last_data[i].text+'</div><div class="ind-user-time right"> <i class="fa fa-clock-o"></i> ' + data.last_data[i].date +'</div><hr class="right"></div>';
               left_tab.insertAdjacentHTML("beforeend",user);
               i++;
           }
             user = '<div class="ind-user left" data-id='+data.result[i].id+'><span class="ind-user-st"><i class="fa fa-circle"></i></span><div class="ind-user-image left z-depth-2"> <img src="me.jpg"> </div><div class="ind-user-name left">'+data.result[i].username+'</div><div class="ind-user-text left">'+data.last_data[i].text+'</div><div class="ind-user-time right"> <i class="fa fa-clock-o"></i> ' + data.last_data[i].date +'</div><hr class="right"></div>';
             left_tab.insertAdjacentHTML("beforeend",user);
           
        }

          
        var d = document, _id, mess, messs, chatBody = document.getElementsByClassName("right-tab-textsbox")[0], result, 
            sel_name,body = d.getElementsByTagName("body")[0], trEl = $(".left-column"), left_col_head = $(".left-col-head");
     
        d.addEventListener("click",(e)=>{
            
            var event = e.target, text_to = document.getElementsByClassName("user-to-name")[0];

              //Hiding left column when width is lesser

              if(body.clientWidth < 600){
                trEl.slideUp(200);
                //Opening and closing the Users List
                $(".left-tab-toggle").click((e)=>{
                  e.stopPropagation();
                  trEl.slideDown(200);
                });
                $(left_col_head).click((e)=>{
                  e.stopPropagation();
                });
              }

             
              if(event.parentNode.classList.contains("users-list") || event.parentNode.classList.contains("ind-user")){
                if(event.parentNode.classList.contains("ind-user")){
                  _id = event.parentNode.getAttribute("data-id");

                  sel_name = event.parentNode.children[2].textContent;

                  USER = _id; 
                  
                  let l = event.parentNode.parentNode.children.length,
                      el = event.parentNode.parentNode.children;
                  for(var i = 0;i<l;i++){
                    if(el[i].classList.contains("ind_user_active")){
                      el[i].classList.remove("ind_user_active");
                    }
                  }
                  event.parentNode.classList.add("ind_user_active");
                  text_to.textContent = sel_name;

                } else if(event.parentNode.classList.contains("users-list")){
                  _id = event.getAttribute("data-id");
                  sel_name = event.children[2].textContent;
                  let l = event.parentNode.children.length,
                      el = event.parentNode.children;
                  for(var i = 0;i<l;i++){
                    if(el[i].classList.contains("ind_user_active")){
                      el[i].classList.remove("ind_user_active");
                    }
                  }
                  event.classList.add("ind_user_active");
                  text_to.textContent = sel_name;
                }
                  USER = _id;
                  socket.emit("get_user_messages",{clicked:_id,active:data.active_user});

                  CLICKED = true;
                  document.getElementsByClassName("right-tab-wrap")[0].style.display="none";
                  document.getElementsByClassName("right-tab-indtexts")[0].style.display="block";

                   

              }


        })


        var ac_user = data.active_user;
        ME = ac_user;

        socket.on("get_ret_messages",(data)=>{
             
           while (chatBody.hasChildNodes()) { chatBody.removeChild(chatBody.firstChild); }
              
               for(let i = 0; i<data.length;i++){
                if(data[i].mess_to == ac_user){
                    mess = '<div class="bubble you">'+data[i].mess_txt+'<br><span class="time"><i class="fa fa-clock-o"></i> '+ data[i].mess_time+'</span></div>';
                      chatBody.insertAdjacentHTML("beforeend",mess);
                      if((i+1)==data.length && CLICKED===false){
                          var a = new Audio("you-wouldnt-believe.mp3");
                          a.play();
                         }
                   }
                   else{
                     mess = '<div class="bubble me">'+data[i].mess_txt+'<br><span class="time"><i class="fa fa-clock-o"></i> '+ data[i].mess_time+'</span></div>';
                     chatBody.insertAdjacentHTML("beforeend",mess);
                 }
              }
              
            chatBody.scrollTop = chatBody.scrollHeight;

          });
    });




   var txtarea = document.getElementsByClassName("type_message")[0];

   txtarea.addEventListener("keypress",(e)=>{
      if(txtarea.value.length>10 && e.keyCode===13 && e.shiftKey===false){
            e.preventDefault();

            socket.emit("textarea_input",{text:txtarea.value,from:ME,to:USER});
            
            txtarea.value = "";

      } else{
      }
   })
   
   var chatBody = document.getElementsByClassName("right-tab-textsbox")[0]
   socket.on("play_sound",(data)=>{
        mess = '<div class="bubble me">'+data.res.text+'<br><span class="time">'+data.res.date+'</span></div>';
    chatBody.insertAdjacentHTML("beforeend",mess);

   });


   setInterval(()=>{
     socket.emit("get_user_messages",{clicked:USER,active:ME});
     socket.emit("user_messages",ME);
     CLICKED = false; 
   },400);

   var _logout = document.getElementsByClassName("logout")[0];
   _logout.addEventListener("click",()=>{
       
       $.removeCookie('_session');
       socket.emit('update_logout',{user:ME});
   });

   socket.on("logout_success",()=>{
      window.location.reload();
      $('.auth_container').show();
      $('.chat-wrap').hide();
   });

   //UPDATES PROFILE PICTURE
   var file_inp = document.getElementById("upl_img");
   file_inp.addEventListener("change",(e)=>{
    
      if('files' in file_inp){
         if(file_inp.files.length==0){
            alert("Select an Image to upload !");
         }else{

            var data = $(file_inp.value);
            console.log(data);
            socket.emit("user_image",data);
            

            
         }
      }
        
   })


}//End of the if statment








})(); //End of the function





/*
  
  =======================================================================================================
  ======================================= PARTICLES.JS ANIMATIONS =======================================
  =======================================================================================================

*/





particlesJS("particles-js", {
  "particles": {
    "number": {
      "value": 100,
      "density": {
        "enable": true,
        "value_area": 900
      }
    },
    "color": {
      "value": ["#aa73ff", "#f8c210", "#83d238", "#33b1f8"]
    },
    "shape": {
      "type": "circle",
      "stroke": {
        "width": 0,
        "color": "#000000"
      },
      "polygon": {
        "nb_sides": 15
      }
    },
    "opacity": {
      "value": 0.7,
      "random": false,
      "anim": {
        "enable": false,
        "speed": 1.5,
        "opacity_min": 0.15,
        "sync": false
      }
    },
    "size": {
      "value": 3.5,
      "random": false,
      "anim": {
        "enable": true,
        "speed": 2,
        "size_min": 0.15,
        "sync": false
      }
    },
    "line_linked": {
      "enable": true,
      "distance": 110,
      "color": "#33b1f8",
      "opacity": 0.25,
      "width": 1
    },
    "move": {
      "enable": true,
      "speed": 1.6,
      "direction": "none",
      "random": false,
      "straight": false,
      "out_mode": "out",
      "bounce": false,
      "attract": {
        "enable": false,
        "rotateX": 600,
        "rotateY": 1200
      }
    }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events": {
      "onhover": {
        "enable": false,
        "mode": "repulse"
      },
      "onclick": {
        "enable": false,
        "mode": "push"
      },
      "resize": true
    },
    "modes": {
      "grab": {
        "distance": 400,
        "line_linked": {
          "opacity": 1
        }
      },
      "bubble": {
        "distance": 400,
        "size": 40,
        "duration": 2,
        "opacity": 8,
        "speed": 3
      },
      "repulse": {
        "distance": 200,
        "duration": 0.4
      },
      "push": {
        "particles_nb": 4
      },
      "remove": {
        "particles_nb": 2
      }
    }
  },
  "retina_detect": true
});

particlesJS("particles-js2", {
  "particles": {
    "number": {
      "value": 400,
      "density": {
        "enable": true,
        "value_area": 800
      }
    },
    "color": {
      "value": "#fff"
    },
    "shape": {
      "type": "circle",
      "stroke": {
        "width": 0,
        "color": "#000000"
      },
      "polygon": {
        "nb_sides": 5
      },
      "image": {
        "src": "img/github.svg",
        "width": 100,
        "height": 100
      }
    },
    "opacity": {
      "value": 0.5,
      "random": true,
      "anim": {
        "enable": false,
        "speed": 1,
        "opacity_min": 0.1,
        "sync": false
      }
    },
    "size": {
      "value": 4,
      "random": true,
      "anim": {
        "enable": false,
        "speed": 40,
        "size_min": 0.1,
        "sync": false
      }
    },
    "line_linked": {
      "enable": false,
      "distance": 500,
      "color": "#ffffff",
      "opacity": 0.4,
      "width": 2
    },
    "move": {
      "enable": true,
      "speed": 2,
      "direction": "bottom",
      "random": false,
      "straight": false,
      "out_mode": "out",
      "bounce": false,
      "attract": {
        "enable": false,
        "rotateX": 600,
        "rotateY": 1200
      }
    }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events": {
      "onhover": {
        "enable": true,
        "mode": "bubble"
      },
      "onclick": {
        "enable": true,
        "mode": "repulse"
      },
      "resize": true
    },
    "modes": {
      "grab": {
        "distance": 400,
        "line_linked": {
          "opacity": 0.5
        }
      },
      "bubble": {
        "distance": 400,
        "size": 4,
        "duration": 0.3,
        "opacity": 1,
        "speed": 3
      },
      "repulse": {
        "distance": 200,
        "duration": 0.4
      },
      "push": {
        "particles_nb": 4
      },
      "remove": {
        "particles_nb": 2
      }
    }
  },
  "retina_detect": true
});

/*
  
  =======================================================================================================
  ========================================== GENERAL PROGRAMMING ========================================
  =======================================================================================================

*/




$(document).ready(()=>{
  //Show an hide Login and Sign ups 
  $(".show_signup").click(()=>{ $("#login_form").hide(); $("#signup_form").show();  });
  $(".show_login").click(()=>{  $("#signup_form").hide(); $("#login_form").show();  });

  var body = document.getElementsByTagName("body")[0],trEl = $(".left-column");

  window.onresize = (e)=>{ if(body.clientWidth > 600){ trEl.show(300); } }
 
  //Opening or animating the profile Tab
  $(".open_profile").click(()=>{$(".profile_edit_tab").animate({"left":"0"},400);});
  //Closing the profile tab
  $(".back_to_list").click(()=>{$(".profile_edit_tab").animate({"left":"-100%"},400);});




})



