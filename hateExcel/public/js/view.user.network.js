/**
 * ネットワークタブ
 */

( function ( $, cms ) {

  var
    networkView
  , elements = {
      'btn' : {
        'cancel'    : '.btn--cancel',
        'delete'   : '.btn--del',
        'save'     : '.btn--save',
        'edit'     : '.btn--edit',
        'download' : '.btn--download',
        'close'    : '.btn--close',
        'exec'     : '.btn--exec',
      },
      'select-clients' : '.select-clients',
      'checkbox' : '.mdl-checkbox',
      'download' : {
        'fenics'      : '.download--fenics',
      },
      'table'  : '.fenics-table',
      'dialog' : {
        'download' : '#modal-network-download',
        'delete'   : '#confirm-delete-fenics-accounts'
      }
    }
  , _openDialog
  , _closeDialog
  , _execDowload
  , _downloadFile
  , _getSelectItem
  , _goEditMode
  , _deleteFenicsAccounts
  , _save
  , selectNetwork
  , clear
  , refresh
  , drawTable
  , initModule
  ;

  /**
   * 編集モード
   * TODO:セレクトボックス指定のためのPropertyを作る
   */
  _goEditMode = function () {
    networkView.get('btn__edit').addClass('is-hidden');
    networkView.get('btn__download').addClass('is-hidden');
    networkView.get('btn__cancel').removeClass('is-hidden');
    networkView.get('btn__delete').removeClass('is-hidden');
    networkView.get('btn__save').removeClass('is-hidden');

    // wrapではなく、propertyをしていさせる
    networkView.wrap.find('.select-clients').prop('disabled', false);

  };

  /**
   * 通常モードに戻る
   */
  _backMode = function () {
    networkView.get('btn__edit').removeClass('is-hidden');
    networkView.get('btn__download').removeClass('is-hidden');
    networkView.get('btn__cancel').addClass('is-hidden');
    networkView.get('btn__delete').addClass('is-hidden');
    networkView.get('btn__save').addClass('is-hidden');

    networkView.wrap.find('.select-clients').prop('disabled', true);

  };


  _openDialog = function () {
    networkView.get('dialog__download').get(0).showModal();
  };

  _closeDialog = function () {
    networkView.get('dialog__download').get(0).close();
  };

  _execDowload = function () {

    // ダウンロード
    _.each( networkView.get('checkbox'), function ( val, key ) {
      if( $(val).hasClass('is-checked') ) {
        $(val).find('a')[0].click();
      }
    });

    // 初期化
    clear();

    // // 閉じる
    networkView.get('dialog__download').get(0).close();
  };

  _downloadFile = function () {

    var
      csv_header   = '"※update_flag[A:Add,M:modify,D:Delete] ",※Prefix,※user_label,init_password,id_group,access_control_group,start_date[ex.20091201],end_date[ex.20091231],comment1,comment2,comment3,"regist_terminal_flag[1:Pre-Reg,2:Auto-Reg,3:Approval]",card_line_no01[ex.09012345678],card_line_no02[ex.09012345678],card_line_no03[ex.09012345678],card_line_no04[ex.09012345678],card_line_no05[ex.09012345678],card_line_no06[ex.09012345678],card_line_no07[ex.09012345678],card_line_no08[ex.09012345678],card_line_no09[ex.09012345678],card_line_no10[ex.09012345678]'
    , kid          =  cms.model.userBaseInfo.getCache().kid
    , file_name    = new moment().format('YYYYMMDD') + '_' + kid + '_fenicsAccount.csv'
    , list_checked = _getSelectItem()
    , downloadMap
    , blob
    ;

    // 検索データがゼロのとき、処理終了
    if ( list_checked.length < 1 ) {
      return;
    }

    // 取得データからモデルにデータ検索
    downloadMap = cms.model.userNetwork.makeAccountMapList( list_checked );

    // データ作成
    blob = util.convertMap2Blob( downloadMap, csv_header );

    // ダウンロード
    util.downloadFile( this, blob, file_name );

  };

  /**
   * チェックされたユーザを取得する
   */
  _getSelectItem = function () {

    var ids = _.map( $('.is-selected', networkView.top ), function (val,key){
      return { 'fenics_id' : $(val).attr('id') } ;
    });

    if ( ids.length === 0 ) {
      alert('選択されていません');
      return [];
    }

    return ids;

  };


  _deleteFenicsAccounts = function () {

    var
      list_accounts           = _getSelectItem()
    , kid                     = cms.model.userBaseInfo.getCache().kid
    , number_accounts_now     = cms.model.kids.find({kid : kid})[0].number_pc
    , number_deleted_accounts
    ;

    if ( list_accounts && list_accounts.length > 0 ) {

      number_deleted_accounts = list_accounts.length

      // check
      console.log(list_accounts);

      // 端末削除
      cms.model.userNetwork.delete( list_accounts, function () {

        // 端末台数の変更
        cms.model.kids.update({
            'kid'       : kid,
            'number_pc' : number_accounts_now - list_accounts.length
          }, function () {
            cms.view.userBaseInfo.refresh();
            refresh();
        });

      });

    }

  };

  _save = function () {

  };

  /**
   * ビジVユーザーかどうかで表示内容を分岐する
   */
  selectNetwork = function () {

  };

  redrawTable = function ( data ) {

    var
      data     = {
        list      : data,
        is_redraw : true,
        clients   : cms.model.clients.find({ is_admin : 0 })
      }
    , tmpl     = customer.db.getHtml('template/user.network.html')
    , complied = _.template( tmpl )
    ;

    networkView.wrap.find('table').remove();
    networkView.wrap.append( complied(data) );
    componentHandler.upgradeElements( networkView.wrap );

  };

  drawTable = function ( data ) {

    var
      data     = {
        list      : data,
        is_redraw : false,
        clients   : cms.model.clients.find({ is_admin : 0 })
      }
    , tmpl     = customer.db.getHtml('template/user.network.html')
    , complied = _.template( tmpl )
    ;

    $('#usr-network-panel').append( complied(data) );

  };

  clear = function () {

    _.each( networkView.get('checkbox'), function ( val, key ) {
      if ( $(val).hasClass('is-checked') ) {
        $(val).trigger('click');
      }
    });

  };

  refresh = function () {

    if ( cms.model.userNetwork.getCache().length > 0 ) {
      var kid = cms.model.userNetwork.getCache()[0].kid;
      cms.model.userNetwork.fetch( kid, redrawTable );
    }

  };

  initModule = function () {

    drawTable();

    util.confirm({
      selector : '#usr-network-panel',
      id       : 'confirm-delete-fenics-accounts',
      msg      : '選択したユーザを削除しますか？',
      yes      : _deleteFenicsAccounts
    });

    networkView = new Controller('#usr-network-panel');
    networkView.initElement( elements );

    networkView.addListener({
      'click btn__download'     : _openDialog,
      'click btn__close'        : _closeDialog,
      'click btn__exec'         : _execDowload,
      'click btn__delete'       : function () { networkView.get('dialog__delete').get(0).showModal(); },
      'click btn__edit'         : _goEditMode,
      'click btn__cancel'       : _backMode,
      'click download__fenics'  : _downloadFile
    });

  };


  // to public
  cms.view.userNetwork = {
    initModule : initModule,
    redrawTable : redrawTable,
  };

} ( jQuery, customer ));