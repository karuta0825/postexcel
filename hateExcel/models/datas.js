// メンバ変数の宣言
var
  async    = require('async')
  database = require('./database'),
  querys   = require('./list_query'),
  flow     = require('./flow'),
  db = database.createClient(),
  datas = exports
  ;

datas.authenticate = function ( data, callback ) {
  var
    params = [
      data.user,
      data.pass
    ];

  db.query(
    querys.select.users,
    params,
    function ( err, results, fileds ) {
      db.end();
      // DBエラーのとき
      if ( err ) {
        console.log( err );
        callback(err);
        return;
      }
      // 検索ヒットしたとき
      if ( results && results.length > 0 && results[0].newadd === 0) {
        delete results[0].password;
        callback( null, results[0] );
        return;
      }
      // 検索ゼロ件のとき
      console.log( 'err: ' + err );
      callback( err, null );
      return;
    }
  );
};

datas.makeLoginAccount = function ( data, callback ) {

  db.query(
    querys.insert.make_login_account,
    [ data ],
    function ( err, results, fileld ) {
      if ( err ) {
        console.log(err);
        callback(err);
        return
      }
      callback(null);
      return;
    }
  );

};

datas.selectAll = function ( table, callback ) {
  db.query(
    querys.select[table],
    function ( err, results, fields ) {
      db.end();
      if ( err ) {
        console.log(err);
        callback(err);
      }
      callback( results );
    }
  );
};

datas.select = function ( condition, access, callback ) {
  db.query(
    querys.select[access],
    // [condition],
    condition,
    function ( err, results, fields ) {
      db.end();
      if ( err ) {
        console.log(err);
        // エラーもオブジェクトなのでそのまま返す
        callback(err);
      }
      callback(results);
    }
  );
};


datas.getHeader = function ( callback ) {
  db.query(
    querys.select.header,
    function ( err, results, fields ) {
      db.end();
      if ( err ) { console.log(err); return; }
      callback( results );
    }
  );
};


/**
 * [insert description]
 * @param  {Object}   data
 * @param  {Function} callback
 */
datas.insert = function ( data, table, callback ) {
  db.query(
    querys.insert[table],
    data,
    function ( err, results, fileds ) {
      db.end();
      // エラー時
      if ( err ) {
        console.log(err);
        callback( err );
        return;
      }
      // 正常時
      else {
        callback( null, results );
      }
    }
  );
};


datas.delete = function ( data, query, callback ) {
  db.query(
    querys.delete[query],
     data,
     function ( err, results, fields ) {
      db.end();
      if ( err ) {
        console.log('delete error');
        callback( err );
        return;
      }
      else {
        callback( null );
      }
     }
  );
};



datas.update = function ( data, condition, table, callback ) {
  db.query(
    querys.update[table],
    [ data, condition ],
    function ( err ) {
      db.end();
      if ( err ) {
        console.log(err);
        callback( err );
        return;
      }
      callback(null);
    }
  );
};


var makeUserKey = function ( length ) {
  var c = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var l = length;
  var cl = c.length;
  var r = '';

  for(var i=0; i<l; i++){
    r += c[Math.floor(Math.random()*cl)];
  }

  return r;

};

var makeFenicsKey = function ( length ) {
  var c = 'abcdefghijklmnopwrstrvwxyz';
  var l = length;
  var cl = c.length;
  var r = '';

  for(var i=0; i<l; i++){
    r += c[Math.floor(Math.random()*cl)];
  }

  return r;

};


var findNewDbPass = function ( data, callback ) {
  var db_pass = 'U' + makeUserKey(6);

  datas.select(
    db_pass,
    'db_password',
    function ( result ) {
      if ( result.length !== 0 ) {
        console.log('not unique');
        findNewDbPass( null, callback );
      }
      else {
        // console.log('ok: ' +  db_pass)
        if ( typeof callback === 'function') {
          callback( null, db_pass );
        }
      }
    }
  );
};

var findNewUserkey = function ( data, callback ) {
  var userkey = makeUserKey(6);

  datas.select(
    userkey,
    'userkey',
    function ( result ) {
      if ( result.length !== 0 ) {
        console.log('not unique');
        findNewUserkey( null, callback );
      }
      else {
        if ( typeof callback === 'function') {
          callback( null, userkey );
        }
      }
    }
  );
};

var findNewKid = function ( data, callback ) {

  datas.select(
    [data],
    'kid',
    function ( result ) {
      var kid = Number(result[0].kid.slice(3)) + 1;
      if ( typeof callback === 'function') {
        callback( null, 'KID' + kid );
      }
    }
  );

};

var findNewFenicsKey = function ( data, callback ) {

  var fenics_key = data || makeFenicsKey(3);

  datas.select(
    fenics_key,
    'is_unique_fenicskey',
    function ( result ) {
      if ( result.length !== 0 ) {
        console.log('not unique');
        findNewFenicsKey( null, callback );
      }
      else {
        if ( typeof callback === 'function') {
          callback( null, fenics_key );
        }
      }
    }
  );
};

var findEnvironmentId = function ( data, callback ) {

  var params = [
    data.system_type,
    data.version
  ];

  datas.select(
    params,
    'find_environment_id',
    function ( result ) {
      console.log(result[0]);
      if ( typeof callback === 'function') {
        callback( null, result[0].id );
      }
    }
  );

};

var makeNewFenicsIp = function ( data, callback ) {

  datas.select(
    [],
    'get_new_fenics_ip',
    function ( result ) {
      if ( typeof callback === 'function') {
        callback( null, result[0].next_ip );
      }
    }
  );

};

/**
 * [makeNewFenicsId description]
 * @param  {Object}   data
 * @param  {Object}   data.kid         - kid
 * @param  {Object}   data.fenics_key  - fenics_key
 * @param  {Function} callback
 * @return {String}
 */
var makeNewFenicsId = function ( data, callback ) {

  datas.select(
    [data.kid],
    'find_last_fenics_id',
    function ( result ) {
      if ( result.length === 0 ) {
        callback( null, data.fenics_key + '0001')
      }
      else {
        callback( null, getNextZeroPadData( result[0].fenics_id ) );
      }
    }
  );

};

/**
 * [makeNewClient description]
 * @param  {Object}   data
 * @param  {String}   data.kid
 * @param  {String}   data.user_key
 * @param  {Function} callback
 */
var makeNewClientId = function ( data, callback ) {

  datas.select(
    [data.kid],
    'find_last_client_id',
    function ( result ) {
      console.log(result);
      if ( result.length === 0 ) {
        callback( null, data.userkey + '0001')
      }
      else {
        callback( null, getNextZeroPadData( result[0].client_id ) );
      }
    }
  );

};


var getNextZeroPadData = function ( value ) {
    var
      numOnly  = value.match(/(\d+)$/)[0],
      notNum   = value.substr(0, value.length - numOnly.length),
      fmtNum   = Number(numOnly),
      nextNum  = fmtNum + 1,
      zeroPad  = ( '000' + nextNum ).slice( -1 * numOnly.length ),
      nextData = notNum + zeroPad
      ;
    return nextData;
};

/**
 * 新たなfenicsアカウントを作成
 * @param  {Object}   input_map
 * @param  {Function} callback
 * @return {[type]}
 */
var makeFenicsAccount = function ( input_map, idx, callback ) {

  var fenics_account = {};

  async.series([
    function ( callback ) {
      makeNewFenicsId( input_map, callback );
    },
    function ( callback ) {
      makeNewFenicsIp( null, callback );
    }
  ], function (err, results) {
    if ( err ) { console.log( err ); }

    fenics_account['kid']        = input_map.kid;
    fenics_account['fenics_id']  = results[0];
    fenics_account['password']   = results[0];
    fenics_account['fenics_ip']  = results[1];
    fenics_account['fenics_key'] = input_map.fenics_key;
    fenics_account['start_on']   = new Date();
    fenics_account['create_on']  = new Date();

    // check
    // console.log( fenics_account );

    datas.insert( fenics_account, 'make_fenics_account', function ( err, results ) {
      // 連続insertでKIDが重複していた場合、再作成
      if ( err ){
        console.log(err);
        datas.makeFenicsAccount( input_map );
      }
      else {
        if ( typeof callback === 'function') {
          callback(null);
        }
      }
    });

  });
};

/**
 * windows接続クライアントを作成
 * @param  {[type]}   input_map
 * @param  {Function} callback
 * @return {[type]}
 */
var makeClient = function ( input_map, idx, callback ) {

  var client = {};

  async.series([
    function ( callback ) {
      makeNewClientId( input_map, callback );
    }
  ], function ( err, results ) {
    if ( err ) { console.log(err); }

    client['kid']            = input_map.kid
    client['client_id']      = results[0];
    client['client_pass']    = results[0];
    client['create_on']      = new Date();
    client['create_user_id'] = input_map.create_user_id;
    client['is_admin']       = 0;

    console.log(client);
    datas.insert( client, 'make_client', function ( err, result ) {
      if ( err ) {
        console.log(err);
        datas.makeClient( input_map );
      }
      else {
        if ( typeof callback === 'function' ) {
          callback(null);
        }
      }
    });

  });

};

var makeService = function ( list_item, idx, callback ) {

  var data = list_item[idx];

  datas.insert( data, 'services', function ( err, results ) {
    // 連続insertでKIDが重複していた場合、再作成
    if ( err ){
      console.log(err);
      callback( err );
      return;
    }

    if ( typeof callback === 'function') {
      callback({ result : 'OK'});
    }

  });

};

var makeServer = function ( list_item, idx, callback ) {

  var data = list_item[idx];
  console.log(idx);
  console.log(data);

  datas.insert( data, 'servers', function ( err, results ) {
    // 連続insertでKIDが重複していた場合、再作成
    if ( err ){
      console.log(err);
      callback( err );
      return;
    }

    if ( typeof callback === 'function') {
      callback({ result : 'OK'});
    }

  });

};


/**
 * fenicsアカウント作成関数
 */
datas.makeFenicsList = flow.makeSyncLoop( makeFenicsAccount );

datas.makeClientList = flow.makeSyncLoop( makeClient );

datas.makeServiceList = flow.makeSyncLoop( makeService );

datas.makeServerList = flow.makeSyncLoop( makeServer );



/**
 * 空ユーザー作成関数
 * @param  {[type]}   input_map
 * @param  {Function} callback
 * @return {[type]}
 */
datas.makeUser = function ( input_map, callback ) {
  var set = {};
  async.series([
      function(callback) {
        findNewKid( input_map.environment_id, callback );
      },
      function(callback) {
        findNewUserkey(null, callback );
      },
      function(callback) {
        findNewDbPass(null, callback );
      },
      function(callback) {
        findNewFenicsKey(null, callback);
      }
  ], function(err, results) {


      set['kid']            = results[0];
      set['userkey']        = results[1];
      set['db_password']    = results[2];
      set['fenics_key']     = results[3];
      set['server']         = input_map['server'];
      set['environment_id'] = input_map['environment_id'];
      set['create_user_id'] = input_map['create_user_id'];
      set['create_on']      = new Date();


      datas.insert( set, 'make_user', function ( result ) {
        // 連続insertでKIDが重複していた場合、再作成
        if ( result && result.errno === 1062 ){
          datas.make_user( input_map );
        }
        else {
          callback(set);
        }
      });
  });
};

datas.makeMemo = function ( input_map, callback ) {

  datas.insert( input_map, 'make_memo', function ( err, result ) {
    if ( err ){
      callback(err);
    }
    else {
      callback(null);
    }
  });

};


/**
 * KIDから使用ライセンスを取得
 * @param  {[type]}   kid
 * @param  {Function} callback
 * @return {Object}
 */
datas.getLicense = function ( kid, callback ) {
  datas.select(
    [kid],
    'get_version_by_kid',
    function ( result ) {
      // ライセンス文字列からオブジェクトに変換
      datas.select( result[0].version,'get_services_by_version', function ( services ) {

        // サービス一覧オブジェクト生成
        var obj = {};
        for ( var i = 0; i < services.length ; i += 1 ) {
          obj[ services[i].service_id ] = 0;
        }

        // 使用ライセンスのフラグ立て
        datas.select(kid, 'licenses',function ( result ) {
          var
            str_licenses = result[0].services || ''
          , list_licenses = []
          ;

          if ( str_licenses.indexOf(':') > 0 ) {
             list_licenses = str_licenses.split(':');
          } else {
            if ( str_licenses ) {
              list_licenses = [ str_licenses ];
            }
          }


          for ( var i = 0 ; i < list_licenses.length ; i+=1 ) {
            obj[list_licenses[i]] = 1;
          }

          obj.kid = result[0].kid;

          if ( typeof callback === 'function' ){
            callback([obj]);
          }

        });

      });
    }
  );

};


///////////////
// unit test //
///////////////

// for( var i = 0; i < 100; i += 1) {
  // make_user(4, 1);
// }

// findNewFenicsKey('nfg');
// makeNewFenicsIp();

// makeNewFenicsId({ fenics_key : 'busiv', kid : 'KID77576' }, function( err, result ) {
//   console.log(result);
// });

// makeNewClient({kid : 'KID77160'});

// datas.getLicense('KID92468');
// datas.getLicense('KID02907');


// 複数インサートテスト
// var lists = [
//   {          service_id : 'B1', service_name : 'B1', version : 'LM' },
//   {          service_id : 'B3', service_name : 'B2', version : 'LM' },
//   {          service_id : 'B4', service_name : 'B2', version : 'LM' },
//   {          service_id : 'B5', service_name : 'B2', version : 'LM' },
//   {          service_id : 'B6', service_name : 'B2', version : 'LM' },
//   {          service_id : 'B7', service_name : 'B2', version : 'LM' },
//   { id : 70, service_id : 'A1', service_name : 'A1', version : 'LM' },
//   { id : 73, service_id : 'A4', service_name : 'A4', version : 'LM' },
//   {          service_id : 'B2', service_name : 'B2', version : 'LM' },
//   {          service_id : 'B8', service_name : 'B2', version : 'LM' },
//   {          service_id : 'B9', service_name : 'B2', version : 'LM' },
//   {          service_id : 'M2', service_name : 'B2', version : 'LM' },
//   {          service_id : 'M3', service_name : 'B2', version : 'LM' },
//   {          service_id : 'M4', service_name : 'B2', version : 'LM' },
//   {          service_id : 'M5', service_name : 'B2', version : 'LM' },
//   {          service_id : 'M6', service_name : 'B2', version : 'LM' },
//   {          service_id : 'M7', service_name : 'B2', version : 'LM' },
//   {          service_id : 'M8', service_name : 'B2', version : 'LM' },
//   {          service_id : 'M9', service_name : 'B2', version : 'LM' },
//   { id : 71, service_id : 'A2', service_name : 'A2', version : 'LM' },
//   { id : 72, service_id : 'A3', service_name : 'A3', version : 'LM' }
// ];
// datas.makeServiceList( lists, lists.length, function (result) {
//   console.log( result );
// });


