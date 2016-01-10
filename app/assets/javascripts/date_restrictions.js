// date restrictions only for the member rides form

$('.rides.new').ready(function() {

  //date restrictions 0 --> Sunday, ..., 6 --> Saturday

  $('#datepicker').change(function() {
    var today = new Date();
    var dayToday = today.getDay();
    var inputDate = new Date($('.ride-pickup-date').val());
    var inputWeekday = inputDate.getDay();

    function dayDiff(first, second) {
      return Math.ceil((second - first) / (1000 * 60 * 60 * 24));
    }


    // clear modal p tags, so that nothing lingers
    $('#weekend-error').html('');
    $('#advance-error').html('');


    if (inputWeekday === 0 || inputWeekday === 6) {
      $('#weekend-error').html('If you would like to request a ride for the weekend, please call Surrey Services at 610-647-6404.')
      $('#ride-modal').openModal();
      $('.ride-pickup-date').val('');
    } else if (today > inputDate) {
      $('#advance-error').html("Invalid date. You must request a ride at least 3 business days in advance.")
      $('#ride-modal').openModal();
      $('.ride-pickup-date').val('');
    }

    // Saturday: can take requests starting Wed
    else if (dayToday === 6 && dayDiff(today, inputDate) < 4) {
      $('#advance-error').html("Invalid date. You must request a ride at least 3 business days in advance.")
      $('#ride-modal').openModal();
      $('.ride-pickup-date').val('');
    }

    // Friday: can take requests starting Wednesday
    else if (dayToday === 5 && dayDiff(today, inputDate) < 5) {
      $('#advance-error').html("Invalid date. You must request a ride at least 3 business days in advance.")
      $('#ride-modal').openModal();
      $('.ride-pickup-date').val('');
    }

    // Thursday: can take requests starting Tues
    else if (dayToday === 4 && dayDiff(today, inputDate) < 5) {
      $('#advance-error').html("Invalid date. You must request a ride at least 3 business days in advance.")
      $('#ride-modal').openModal();
      $('.ride-pickup-date').val('');
    }

    //Sun, Mon, Tues, Wed: 3 days in advnace
    else if ((dayToday === 0 || dayToday === 1 || dayToday === 2 || dayToday === 3) && dayDiff(today, inputDate) < 3) {
      $('#advance-error').html("Invalid date. You must request a ride at least 3 business days in advance.")
      $('#ride-modal').openModal();
      $('.ride-pickup-date').val('');
    }


  });

});
