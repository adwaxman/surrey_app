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
//= require_tree .
//= require pickadate
//= require picker
//= require picker.date
//= require picker.time
//= require phonevalidator
//= require drivers
//= require turbolinks
//= require turboboost/turboboost



$(document).ready(function() {
  $('select').material_select();

});

$(document).ready(function() {
  $('.check1').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable1').attr('disabled', true);
    } else {
      {
        $('.disable1').attr('disabled', false);
      }
    }
  });
  $('.check2').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable2').attr('disabled', true);
    } else {
      {
        $('.disable2').attr('disabled', false);
      }
    }
  });
  $('.check3').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable3').attr('disabled', true);
    } else {
      {
        $('.disable3').attr('disabled', false);
      }
    }
  });
  $('.check4').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable4').attr('disabled', true);
    } else {
      {
        $('.disable4').attr('disabled', false);
      }
    }
  });
  $('.check5').on('click', function(event) {

    if ($(this).is(":checked")) {
      $('.disable5').attr('disabled', true);
    } else {
      {
        $('.disable5').attr('disabled', false);
      }
    }
  });


})
