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

//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
//= require pickadate
//= require picker
//= require picker.date
//= require picker.time
//= require phonevalidator
//= require drivers
//= require turbolinks
//= require rotate




$(document).ready(function() {
  $('select').material_select();

  $('.timepicker').pickatime({
    interval: 15,
    min: [
      6, 0
    ],
    max: [18, 0]
  });
});

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
      }
    }
  });
  $('.check2').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable2').attr('disabled', false);
    } else {
      {
        $('.disable2').attr('disabled', true);
      }
    }
  });
  $('.check3').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable3').attr('disabled', false);
    } else {
      {
        $('.disable3').attr('disabled', true);
      }
    }
  });
  $('.check4').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable4').attr('disabled', false);
    } else {
      {
        $('.disable4').attr('disabled', true);
      }
    }
  });
  $('.check5').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable5').attr('disabled', false);
    } else {
      {
        $('.disable5').attr('disabled', true);
      }
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
