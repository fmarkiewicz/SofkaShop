$ ->
  $(".js-photo-modal").on 'click', ->
    $("#photoModal").find('.modal-body').html $(this).html()
