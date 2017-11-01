$(document).ready ->
  $('#quantity, #currency, #currency_destination').on 'input' , ->
    quantity = $('#quantity').val()
    currency = $('#currency').val()
    currency_destination = $('#currency_destination').val()
    if currency is currency_destination
      $('#result').val(quantity)
    else
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
            currency: currency,
            currency_destination: currency_destination,
            quantity: quantity
          }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
      return false