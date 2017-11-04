trigger_conversion_request = ->
  $.ajax '/exchange',
      type: 'POST',
      dataType: 'json',
      data: {
        currency: $('#currency').val(),
        currency_destination: $('#currency_destination').val(),
        quantity: $('#quantity').val()
      },
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
      success: (data, text, jqXHR) ->
        $('#result').val(data.value)

$(document).ready ->
  $('#quantity, #currency, #currency_destination').on 'input', ->
    currency = $('#currency').val()
    desired_currency = $('#currency_destination').val()
    quantity = $('#quantity').val()
    
    if currency is desired_currency
      $('#result').val(quantity)
    else
      trigger_conversion_request()
  
  $('.switch-currency-btn').click ->
    current_currency = $('#currency').val()
    $('#currency').val($('#currency_destination').val())
    $('#currency_destination').val(current_currency)
    $('#currency, #currency_destination').trigger('input')
