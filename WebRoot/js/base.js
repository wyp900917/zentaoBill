$(document).ready(function(){
    
    $(".adwrap").click(function(){
       // $(this).toggleClass("up");
        $(".adminlist").slideToggle();
    });
    $(".adminlist li").click(function(){
        $(".adwrap span").text($(this).text());
        $(".adminlist").hide();
        //$(".adwrap").removeClass("up");
    });
});

$(document).ready(function(){
    //选择人
    $(".sel").click(function(){
        $(this).toggleClass("up");
        $(".namelist").slideToggle();
    });
    $(".namelist li").click(function(){
        $(".sel span").text($(this).text());
        $(".namelist").hide();
        $(".sel").removeClass("up");
    });

    //产品，项目选择人
    $(".sel").click(function(){
        $(this).toggleClass("up");
        $(".pditems").slideToggle();
    });
    $(".pditems li").click(function(){
        $(".sel span").text($(this).text());
        $(".pditems").hide();
        $(".sel").removeClass("up");
    });

    //点击屏幕其他地方弹窗收起
    $(document).mouseup(function(e){
      var _con = $(".sel");   // 设置目标区域
      if(!_con.is(e.target) && _con.has(e.target).length === 0){ // Mark 1
          $(".namelist").hide();  
        $(".sel").removeClass("up");
      }
    });

    $(".tbox .cont").mouseover(function(){
        $(this).addClass("bgtop");
    });
    $(".tbox .cont").mouseleave(function(){
        $(this).removeClass("bgtop");
    });

    $(".tmbox .cont").mouseover(function(){
        $(this).addClass("bgbtm");
    });
    $(".tmbox .cont").mouseleave(function(){
        $(this).removeClass("bgbtm");
    });
})  



//canvas画布
window.onload = function() {
  var lines="";
  var canvas = document.getElementById('canvas');
  var ctx = canvas.getContext('2d');
  canvas.width = canvas.parentNode.offsetWidth;
  canvas.height = canvas.parentNode.offsetHeight;

     ctx.fillStyle='rgba(0,222,255, 0.2)';
     //ctx.fillRect(0,0,canvas.width,canvas.height);

     ctx.beginPath();
    //左上角
     ctx.moveTo(0, canvas.height/2);
     //右上角
     ctx.lineTo(canvas.width, canvas.height/2);
     //右下角
     ctx.lineTo(canvas.width, canvas.height);
     //左下角
     ctx.lineTo(0, canvas.height);
     //左上角
     ctx.lineTo(0, canvas.height/2);
     //闭合路径
     ctx.closePath();
     //填充路径
     ctx.fill();

     //如果浏览器支持requestAnimFrame则使用requestAnimFrame否则使用setTimeout
     window.requestAnimFrame = (function(){
       return window.requestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
           window.mozRequestAnimationFrame ||
           function( callback ){
            window.setTimeout(callback, 1000 / 60);
           };
      })();

      function loop(){
        requestAnimFrame(loop);
      }
    loop();

      var lines = ["rgba(210,240,250, 0.8)", "rgba(210,240,250, 0.6)"];

    function loop(){
     ctx.clearRect(0,0,canvas.width,canvas.height);
     step++;
     //画3个不同颜色的矩形
     for(var j = lines.length - 1; j >= 0; j--) {
       ctx.fillStyle = lines[j];
       //每个矩形的角度都不同，每个之间相差45度
       var angle = (step+j*90)*Math.PI/180;
       var deltaHeight = Math.sin(angle) * 50;
       var deltaHeightRight = Math.cos(angle) * 50;
       ctx.beginPath();
       ctx.moveTo(0, canvas.height/2+deltaHeight);
       ctx.bezierCurveTo(canvas.width /2, canvas.height/2+deltaHeight-0, canvas.width / 2,         canvas.height/2+deltaHeightRight-0, canvas.width, canvas.height/2+deltaHeightRight);
       ctx.lineTo(canvas.width, canvas.height);
       ctx.lineTo(0, canvas.height);
       ctx.lineTo(0, canvas.height/2+deltaHeight);
       ctx.closePath();
       ctx.fill();
    }
     requestAnimFrame(loop);
   }

     //初始角度为0
    var step = 0;
    function loop(){
     ctx.clearRect(0,0,canvas.width,canvas.height);
     step++;
     //画3个不同颜色的矩形
     for(var j = lines.length - 1; j >= 0; j--) {
       ctx.fillStyle = lines[j];
       //每个矩形的角度都不同，每个之间相差45度
       var angle = (step+j*90)*Math.PI/180;
       var deltaHeight = Math.sin(angle) * 50;
       var deltaHeightRight = Math.cos(angle) * 50;
       ctx.beginPath();
       ctx.moveTo(0, canvas.height/2+deltaHeight);
       ctx.bezierCurveTo(canvas.width /2, canvas.height/2+deltaHeight-0, canvas.width / 2,         canvas.height/2+deltaHeightRight-0, canvas.width, canvas.height/2+deltaHeightRight);
       ctx.lineTo(canvas.width, canvas.height);
       ctx.lineTo(0, canvas.height);
       ctx.lineTo(0, canvas.height/2+deltaHeight);
       ctx.closePath();
       ctx.fill();
    }
     requestAnimFrame(loop);
   }

      //初始角度为0
     var step = 0;
     function loop(){
       ctx.clearRect(0,0,canvas.width,canvas.height);
       step++;
       //画3个不同颜色的矩形
       for(var j = lines.length - 1; j >= 0; j--) {
         ctx.fillStyle = lines[j];
         //每个矩形的角度都不同，每个之间相差45度
         var angle = (step+j*90)*Math.PI/180;
         var deltaHeight = Math.sin(angle) * 50;
         var deltaHeightRight = Math.cos(angle) * 50;
         ctx.beginPath();
         ctx.moveTo(0, canvas.height/2+deltaHeight);
         ctx.bezierCurveTo(canvas.width /2, canvas.height/2+deltaHeight-0, canvas.width / 2,         canvas.height/2+deltaHeightRight-0, canvas.width, canvas.height/2+deltaHeightRight);
         ctx.lineTo(canvas.width, canvas.height);
         ctx.lineTo(0, canvas.height);
         ctx.lineTo(0, canvas.height/2+deltaHeight);
         ctx.closePath();
         ctx.fill();
      }
       requestAnimFrame(loop);
      }
}


$(document).ready(function(){
  $(".dplist li").on("click",function(){
    $(this).toggleClass("on");
    $(this).siblings().removeClass("on");
  });

  $(".group").on("mouseover",function(){
    $(this).children(".cont").find("span").addClass("bg");
  });
  $(".group").on("mouseleave",function(){
    $(this).children(".cont").find("span").removeClass("bg");
  });

  // custom scrollbar
    $(".grouplist ,#dp_cont1").niceScroll({styler:"fb",cursorcolor:"#ccc", cursorwidth: '8', cursorborderradius: '8px', background: '#fff', spacebarenabled:false, cursorborder: '0',  zindex: '1000'});
  
});