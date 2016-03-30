class @CRUDStore
  
  constructor: -> {

  }

  ###*
   * Invoke a POST ajax call to @param URL with @param data 
   * call @param succFunc when success  
   * @param  {String} URL      URL formatted as String
   * @param  {Object} data     
   * @param  {[type]} succFunc Success function
  ###
  addEntity: (URL, data, succFunc) ->
    
    $.ajax
      method: 'POST'
      url: URL
      dataType: 'JSON'
      data: data
      success: (k) =>
        succFunc(k)
        

  deleteEntity: (URL, succFunc) ->
    $.ajax
      method: 'DELETE'
      url: URL
      dataType: 'JSON'
      success: () =>
        succFunc()

  editEntity: (URL, data, succFunc) ->
    $.ajax
      method: 'PUT'
      url: URL
      dataType: 'JSON'
      data: data
      success:(data) => 
        succFunc(data)
