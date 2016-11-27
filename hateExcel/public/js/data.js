var customer;
customer =  customer || {};
customer.db = ( function (){

  var 
    configMap, data, getData,
    _ajaxPost, _ajaxGet, _ajaxHtml,
    selectAll, select,
    insert,    update, remove
  ;

  _ajaxGet = function ( url ) {
   var result = $.ajax({
      dataType : 'json',
      url      : url,
      async    : false,
      success  : function ( result ) {
      }
    }).responseText;
   // data = result;
   return result;
  };

  _ajaxHtml = function ( url ) {
     var result = $.ajax({
        dataType : 'text',
        url      : url,
        async    : false,
        success  : function ( result ) {
        },
        error    : function ( XMLHttpRequest ) {
          console.log(XMLHttpRequest);
        }
      }).responseText;
     return result;
  };


  _ajaxPost = function ( url, data ) {
    var result = $.ajax({
      dataType: 'json',
      type    : 'post',
      url     : url,
      async    : false,
      data    : data,
      success : function ( result ) {
      }
    }).responseText;
    return result;
  };

  selectAll = function ( url ) {
    return JSON.parse( _ajaxGet( url ) ) ; 
  };

  select    = function ( url, params ) {
    return JSON.parse( _ajaxPost( url, params ));
  };

  insert    = function ( params ) {
    _ajaxPost( params, 'add' );
  };

  update    = function ( params ) {
    _ajaxPost( params, 'update');
  };

  remove    = function ( params ) {
    _ajaxPost( params, 'delete' );
  };

  return {
    _ajaxHtml : _ajaxHtml,
    selectAll : selectAll,
    select    : select,
    insert    : insert,
    update    : update,
    remove    : remove
  };

}());