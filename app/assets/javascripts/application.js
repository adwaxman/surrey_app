// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs

//= require jquery.turbolinks



//= require rides
//= require drivers
//= require turbolinks
//= require jquery-readyselector
//= require_tree .




// $(document).ready(function() {
//   $('select').material_select();
//
//   $('.timepicker').pickatime({
//     interval: 15,
//     min: [
//       6, 0
//     ],
//     max: [18, 0]
//   });
// });

$(document).ready(function() {

  if ($('.disable1').val() == "") {

    $('.disable1').attr('disabled', true);

  }

  if ($('.disable2').val() == "") {

    $('.disable2').attr('disabled', true);

  }
  if ($('.disable3').val() == "") {

    $('.disable3').attr('disabled', true);

  }
  if ($('.disable4').val() == "") {

    $('.disable4').attr('disabled', true);

  }
  if ($('.disable5').val() == "") {

    $('.disable5').attr('disabled', true);

  }

  // disable time inputs if volunteer unavailable
  $('.check1').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable1').attr('disabled', false);
    } else {
      {
        $('.disable1').attr('disabled', true);
        $('.disable1').val("");
      }
    }
  });
  $('.check2').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable2').attr('disabled', false);
    } else {
      {
        $('.disable2').attr('disabled', true);
        $('.disable2').val("");
      }
    }
  });
  $('.check3').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable3').attr('disabled', false);
    } else {
      {
        $('.disable3').attr('disabled', true);
        $('.disable3').val("");
      }
    }
  });
  $('.check4').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable4').attr('disabled', false);
    } else {
      {
        $('.disable4').attr('disabled', true);
        $('.disable4').val("");
      }
    }
  });
  $('.check5').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable5').attr('disabled', false);
    } else {
      {
        $('.disable5').attr('disabled', true);
        $('.disable5').val("");
      }
    }
  });
$('input').change(function(event) {
  if (Date.parse("1-1-2000 " + $('.monday_min').val()) > Date.parse("1-1-2000 " + $('.monday_max').val())) {
    alert("End time on Monday cannot be earlier than start time");
  }
});
$('input').change(function(event) {
  if (Date.parse("1-1-2000 " + $('.tuesday_min').val()) > Date.parse("1-1-2000 " + $('.tuesday_max').val())) {
    alert("End time on Tuesday cannot be earlier than start time");
  }
});
$('input').change(function(event) {
  if (Date.parse("1-1-2000 " + $('.wednesday_min').val()) > Date.parse("1-1-2000 " + $('.wednesday_max').val())) {
    alert("End time on Wednesday cannot be earlier than start time");
  }
});
$('input').change(function(event) {
  if (Date.parse("1-1-2000 " + $('.thursday_min').val()) > Date.parse("1-1-2000 " + $('.thursday_max').val())) {
    alert("End time on Thursday cannot be earlier than start time");
  }
});
$('input').change(function(event) {
  if (Date.parse("1-1-2000 " + $('.friday_min').val()) > Date.parse("1-1-2000 " + $('.friday_max').val())) {
    alert("End time on Friday cannot be earlier than start time");
  }
});

// prevent submission of of autocomplete forms if invalid input
$('.search-assign-btn').click(function(e) {
    if (arrOfDrivers.indexOf($('#all_drivers').val()) === -1) {
      e.preventDefault();
    }
});

$('.select-member-btn').click(function(e) {
    if (arrOfMembers.indexOf($('#all_members').val()) === -1) {
      e.preventDefault();
    }
});

$('.find-driver-btn').click(function(e) {
    if (arrOfDrivers.indexOf($('#search_drivers').val()) === -1) {
      e.preventDefault();
    }
});

$('.find-member-btn').click(function(e) {
    if (arrOfMembers.indexOf($('#search_members').val()) === -1) {
      e.preventDefault();
    }
});

$('.nonmatch-outreach-btn').click(function(e) {
    if (arrOfDrivers.indexOf($('#all_drivers2').val()) === -1) {
      e.preventDefault();
    }
});



})



// rotate plug in used for gear in nav bar

$(function() {

  $('.settings-icon').click(function() {
    $(this).rotate({
      duration: .7,
      endDeg: 180
    });
  })

});

//initalize materialize modal

$(document).ready(function(){
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal-trigger').leanModal();
});


// show and hide super admin password prompt

$(document).ready(function() {

  if ($('.admin-checkbox').is(":checked")) {
    $('.super-password').show();
  }


  $('.admin-checkbox').click(function() {

    if ($(this).is(":checked")) {
      $('.super-password').show();
    } else {
      $('.super-password').hide();
    }


  });

});

// force timepicker to close after a change is made to the input

$(document).ready(function() {

  $('input.timepicker').change(function() {

    $('.picker--time').close(this);

  });

  $('input.timepicker2').change(function() {

    $('.picker--time').close(this);

  });

});
