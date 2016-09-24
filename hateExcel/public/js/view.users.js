customer.view = ( function () {


  var 
    /*private member*/
    jqueryMap = {}, 

    /*private method*/
    _setJqueryMap, _showTable, _onClickColName,

    /*public method*/
    rowsort, initModule
  ;

  var view = {
    kid    : true,
    server   : true,
    genics   : true,
    userkey    : true
  };

  _setJqueryMap = function () {
    var $table = $('.table'),
        $header = $table.find('thead'),
        $body  = $table.find('tbody')
    ;

    jqueryMap.$table   = $table;
    jqueryMap.$header  = $table.find('th');
    jqueryMap.$body    = $table.find('tbody');
    jqueryMap.$row     = $table.find('tr');
    jqueryMap.$col     = { 
      kid     : $body.find('.kid'),
      severs  : $body.find('.server'),
      genics  : $body.find('.genics'),
      userkey : $body.find('.userkey'),
      author  : $body.find('.author')
    };

  };

  _showTable = function ( data ) {
    var
      tmpl = $('#template').html(),
      rows = _.template( tmpl, data );
    $('tbody').append( rows );
  };

  _onClickColName = function () {
    _.each( view, function ( val, key ) {
      $('thead .' + key ).on( 'click', function () {
        customer.model.sortByCol( key, customer.view.rowsort );
      })
    });
  };

  var selectRow = function ( col, data ) {
    var rows   = jqueryMap.$row;
    $(rows).remove();
    _showTable( data );
    _setJqueryMap();  
  };

  /**
   * データの並び替えと表示
   * @param  {[type]} col
   * @param  {[type]} data
   */
  var rowsort = function ( col , data ) {

    // 行数取得
    var rows = jqueryMap.$row;

    rows.each( function ( key, val ) {
      $(val).attr('id', 'id' + data[key].id );
      $(val).find('.kid'       ).empty().append( data[key].kid        );
      $(val).find('.server'    ).empty().append( data[key].server     );
      $(val).find('.genics'    ).empty().append( data[key].genics     );
      $(val).find('.userkey'   ).empty().append( data[key].userkey    );
      $(val).find('.author'    ).empty().append( data[key].name       );
      $(val).find('.company'   ).empty().append( data[key].company    );
      $(val).find('.updateDate').empty().append( data[key].updateDate );
    });

  };

  initModule = function () {
    // テーブル描画
    _showTable( customer.model.getData() );

    // 描画後dom要素のキャッシュ
    _setJqueryMap();

    // イベント登録
    _onClickColName();

  };

  return {
    initModule : initModule,
    rowsort : rowsort,
    selectRow  : selectRow
  }


}());