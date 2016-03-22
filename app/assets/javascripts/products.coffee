$(document).ready ->
  baseUrl = 'http://devpoint-ajax-example-server.herokuapp.com/api/v1'
  

  $(document).on 'click', '.edit_product_button', (e) ->
    e.preventDefault()
    editForm = $('#new_product_form')
    product_id = $(this).attr('href')
    $.ajax
      url: "#{baseUrl}/products/#{product_id}"
      type: 'GET'
      success: (data) ->
        console.log data 
        console.log 'Success'
        editForm.find('#new_product_form').val product_id.name
        editForm.find('#new_product_form').val product_id.base_price
        editForm.find('#new_product_form').val product_id.description
        $('body').scrollTop 0
      error: (data) ->
        console.log data 

  $('#new_product_form').submit (e) ->
  e.preventDefault()
  name = $(this).find('#new_product_name').val()
  price = $(this).find('#new_product_price').val()
  description = $(this).find('#new_product_description').val()
  $.ajax
    url: "#{baseUrl}/products/#{product_id}"
    type: 'PUT'
    data: product:
      name: new_product_name
      base_price: base_price
      new_product_description: new_product_description
    success: (data) ->
      console.log 'Success'
      console.log data
      return
    error: (data) ->
      console.log data
      return
  
​    



  $(document).on 'click', '.product_delete_button', (e) ->
    e.preventDefault()
    product_id = $(this).attr('href')
    $.ajax 
      url: "#{baseUrl}/products/#{product_id}"
      type: 'DELETE'
      success: (data) ->
        console.log 'scusses,hsjafgew'
        console.log data 
      error: (data) ->
        console.log 'error'
        console.log data  

  $('#new_product_form').submit (e) ->
    e.preventDefault()
    $.ajax
      url: "#{baseUrl}/products"
      type: 'POST'
      data: 
        product:
          name: $('#new_product_name').val()
          base_price: $('#new_product_price').val()
          description: $('#new_product_description').val()
      succcess: (data) ->
        console.log data
      error: (data) ->
        console.log data  

  $.ajax
    url: "#{baseUrl}/products"
    type: 'GET'
    success: (data) ->
      for product in data.products
        $.ajax
          url: '/product_card'
          type: 'GET'
          data:
            product: product
          success: (data) ->
            $('#products').append data 
          error: (data) ->
            console.log data
    error: (data) ->
      console.log data



