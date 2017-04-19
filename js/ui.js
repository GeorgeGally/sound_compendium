//===============================================================
$(document).ready(function(){
  //console.log('testing js');

  //===============================================================
  //SHARE PLUGIN => https://github.com/carrot/share-button
  $('#btnShare').share();


  //===============================================================
  //INFO DIALOG
  var $btnInfo = $('#btnInfo'),
      $dialogInfo = $('#dialogInfo');

  $btnInfo.on('click', function(e){
    $('.header-actions .btn').not(this).removeClass('active intro-active');
    disableOtherActiveDialogsBut('#dialogInfo');

    console.log('info click');
    $(this).toggleClass('active');
    $dialogInfo.toggleClass('active');
  });

  $('#dialogInfo .btn-close').on('click', function(e){
    $btnInfo.removeClass('active');
    $dialogInfo.removeClass('active');
  });


  //===============================================================
  //CANVAS ACTIONS
  
  var $btnStartOver = $('#btnStartOver');

  $btnStartOver.on('click', function(e) {
    location.reload();
  });


  $(this).keydown(function(e) {
    var keyAction =  e.which;
    //console.log(keyAction); // this value

  //   //check if "z" is pressed
  //  if (keyAction == 90) {
  //    console.log('"z" pressed!');

  //     //check if "t" is pressed while mouse is moving
  //     $(this).on('mousemove', UIcontrolScaleMode_ON );
  //    }      

  //   //check if "s" is pressed
  //     if (keyAction == 83) {
  //       console.log('s pressed!');
  //       $dialogSave.addClass('active');
  //     }

    //check if "r" is pressed
    if (keyAction == 82) {
        //console.log('r pressed!');
        location.reload();
        //UIcontrolReload();
      }

  //   //check if "+" is pressed => 171 = Firefox, 187 = Chrome
  //   if (keyAction == /*43*/ 171 || keyAction == 187) {
  //     console.log('"+" pressed!');
  //     UIcontrolScaleUp_ON();
  //   }

  //   //check if "-" is pressed
  //   if (keyAction == 173 || keyAction == 187) {
  //     console.log('"-" pressed!');
  //     UIcontrolScaleDown_ON();
  //   }

  //   //check if "0" is pressed
  //   if (keyAction == 48 ) {
  //     console.log('"0" pressed!');
  //     UIcontrolScaleReset();
  //   }
   });

  // $(this).keyup(function(e) {
  //   var keyAction =  e.which;

  //   if (keyAction == 90) {
  //     console.log('unbind z');
  //     UIcontrolScaleMode_OFF();
  //     $(this).off('mousemove');
  //   }

  //   if (keyAction == 171) {
  //     console.log('unbind +');
  //     UIcontrolScaleUp_OFF();
  //   }

  //   if (keyAction == 173) {
  //     console.log('unbind -');
  //     UIcontrolScaleDown_OFF();
  //   }

  // });

  //CONTROL BAR ANIMATION
  // $('#controlBar .btn').on('click',function(){
  //     console.log('control bar click');
  //     $(this).parents('#controlBar').toggleClass('active');
  // });

});


//===============================================================
//VARIOUS FUNCTIONS
function disableOtherActiveBtns() {
  $('.header-actions .btn').not(this).removeClass('active intro-active');
}

function disableOtherActiveDialogsBut(notThis) {
  $('.custom-dialog').not(notThis).removeClass('active intro-active');
}

var UIcontrolTime = 300;

function UIcontrolClick() {
  $('#controlBar #controlClick').addClass("active");
  setTimeout(function() {
      $('#controlBar #controlClick').removeClass('active');
  }, UIcontrolTime);
}

function UIcontrolScaleUp_ON() {
  $('#controlBar #controlScaleUp').addClass("active");
}

function UIcontrolScaleUp_OFF() {
  $('#controlBar #controlScaleUp').removeClass("active");
}

function UIcontrolScaleDown_ON() {
  $('#controlBar #controlScaleDown').addClass("active");
}

function UIcontrolScaleDown_OFF() {
  $('#controlBar #controlScaleDown').removeClass("active");
}

function UIcontrolScaleMode_ON() {
  $('#controlBar #controlScaleMode').addClass("active");
}

function UIcontrolScaleMode_OFF() {
  $('#controlBar #controlScaleMode').removeClass('active');
}

function UIcontrolScaleReset() {
  $('#controlBar #controlScaleReset').addClass("active");
  setTimeout(function() {
      $('#controlBar #controlScaleReset').removeClass('active');
  }, UIcontrolTime);
}

function UIcontrolReload() {
  $('#controlBar #controlReload').addClass('active');
}