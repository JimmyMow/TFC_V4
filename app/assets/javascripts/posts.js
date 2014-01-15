# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(ducument).ready() {
  $('.header_link').on('click', function() {
      $(this).css({'font-size': 50px})
      $(this).css({'font-weight': 5})
    });
};
