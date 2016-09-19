var customer;
customer =  customer || {};
customer.data = ( function (){

  var 
    configMap, data, 
    _ajaxPost, _ajaxGet,
    selectAll, select,
    insert,    update, remove
  ;

  _ajaxGet = function () {
   var result = $.ajax({
      dataType : 'json',
      url      : 'all',
      async    : false,
      success  : function ( result ) {
        // return result;
      }
    }).responseText;
   return result;
  };

  _ajaxPost = function ( data, add_del ) {
    $.ajax({
      dataType: 'json',
      type    : 'post',
      url     : add_del,
      data    : data,
      success : function ( data ) {
        console.log('success');
      },
      error   :  function ( XMLHttpRequest ) {
        console.log(XMLHttpRequest.responseText);
      }
    });
  };

  selectAll = function () {
    return JSON.parse( _ajaxGet() ) ; 
  };

  select    = function ( params ) {
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
    _ajaxGet  : _ajaxGet,
    selectAll : selectAll,
    select    : select,
    insert    : insert,
    update    : update,
    remove    : remove
  };

}());