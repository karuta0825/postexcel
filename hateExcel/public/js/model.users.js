// var customer;
customer.model = customer.model || {};
customer.model.kids = ( function () {

  var 
    /*private member*/
    _data, _sortOrder = 1,
    /*private method*/

    /*public  method*/
    findByKid, findByServer, findByGenics,
    sortByCol, getData, getHeader,
    initModule
  ;

  findByKid = function ( kid ) {
    return $.grep( _data, function ( val ) {
      return kid === val.kid;
    })[0];
  };

  findByServer = function ( server, callback ) {
    var data = $.grep( _data, function ( val ) { return server === val.server;});
    if ( callback ) {
      callback( 'server', data );
    } 
    else {
      return data;
    }
  };

  findByGenics = function ( genics ) {
    return $.grep( _data, function ( val ) {
      return genics === val.genics;
    })[0];
  };

  /**
   * データソート
   * @param  {String} col - colのキー名
   * @param  {[type]} callbackFromView - Viewで使用するコールバック関数
   * @return {Array}  - ソート結果
   */
  sortByCol = function ( col, callbackFromView ) {
    
    _data.sort( function ( item1, item2 ) {
      item1 = _.isString( item1[col] ) && item1[col].toString().toLowerCase() || item1[col];
      item2 = _.isString( item2[col] ) && item2[col].toString().toLowerCase() || item2[col];
      if ( item1 < item2 ) {
        return -1 * _sortOrder;
      }
      else if ( item1 > item2 ) {
        return 1 * _sortOrder;
      }
      // return 0;
    });

    // 並び替え方向の入れ替え
    _sortOrder *= -1;

    // モデルの変化時にviewを更新する処理
    if( callbackFromView ) {
      callbackFromView( col, _data );
    }

  };

  getData = function () {
    return _data;
  };

  getHeader = function () {
    return customer.db.selectAll('/tableHeader')[0];
  }


  initModule = function () {
    _data = customer.db.selectAll('all');
    return {
      findByKid    : findByKid,
      findByServer : findByServer,
      findByGenics : findByGenics,
      sortByCol    : sortByCol,
      getData      : getData
    };
  };

  /*public method*/
  return {
    initModule   : initModule,
    findByKid    : findByKid,
    findByServer : findByServer,
    findByGenics : findByGenics,
    sortByCol    : sortByCol,
    getData      : getData,
    getHeader    : getHeader
  };

}());