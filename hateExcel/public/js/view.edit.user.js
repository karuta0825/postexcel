/**
 * viewController
 * 新規ユーザー追加
 */
( function ( $, cms ) {

  var
  // member
    editView
  , elements = {
      'btn' : {
        'back'        : '.btn--backList',
        'add-memo'    : '.memo-add',
        'filter-memo' : '.mdl-chip.filter',
      },
      'tab_bar' : {
        'usr-base'    : 'a[href="#usr-base-panel"]',
        'usr-service' : 'a[href="#usr-service-panel"]',
        'usr-client'  : 'a[href="#usr-client-panel"]',
        'usr-partner' : 'a[href="#usr-partner-panel"]',
        'usr-network' : 'a[href="#usr-network-panel"]',
        'usr-history' : 'a[href="#usr-history-panel"]'
      },
      'tab_panel' : {
        'usr-base'    : '#usr-base-panel',
        'usr-service' : '#usr-service-panel',
        'usr-client'  : '#usr-client-panel',
        'usr-partner' : '#usr-partner-panel',
        'usr-network' : '#usr-network-panel',
        'usr-history' : '#usr-history-panel',
      },
      'memo' : {
        'select' : '.filter',
        'list'   : '.memo-list',
        'items'  : '.memo-item',
        'dialog' : '#modal-memo-item'
      }
    }
  , _openMemoDialog
  , _selectMemo
  , _filterMemo
  , backUserTable
  , makeMemos
  , clearFilter
  , initModule
  ;

  _openMemoDialog = function () {

    editView.get('memo__dialog').get(0).showModal();
    cms.view.userMemo.reset();

  };

  _selectMemo = function ( e ) {

    var memo_id, memo;

    if ( $(e.target).data('memo_id') ) {
      memo_id = $(e.target).data('memo_id');
    }
    else {
      memo_id = $(e.target).parents('li').data('memo_id');
    }

    memo = cms.model.userMemo.find({ id : memo_id })[0];

    cms.view.userMemo.makeViewInfo( memo );

    // 更新モードに変更する
    cms.view.userMemo.changeEditMode(true);

    editView.get('memo__dialog').get(0).showModal();

  };

  _filterMemo = function ( e ) {
    var priority = $(e.target).val();

    cms.model.userMemo.find({'priority' : priority}, makeMemos );

  };

  backUserTable = function () {

    // タブ位置を基本情報に戻す
    _.each( editView.get('tab_bar'), function ( val,key ) {
      $(val).removeClass('is-active');
    });

    _.each( editView.get('tab_panel'), function ( val, key ) {
      $(val).removeClass('is-active');
    });

    editView.get('tab_bar__usr-base').addClass('is-active');
    editView.get('tab_panel__usr-base').addClass('is-active');

    // 各タブの初期化
    customer.view.userBaseInfo.clear();
    customer.view.userPartner.clear();
    customer.view.userService.clear();
    cms.view.userClient.clear();
    cms.view.userNetwork.clear();

    $('.main-contents').removeClass('is-active');

    // クリックされたコンテンツにis-activeを付与
    var target = '.main-contents--' + $(this).attr('href').slice(1);
    $(target).addClass('is-active');
  };

  clearFilter = function () {
    editView.get('memo__select').val('all');
  };

  makeMemos = function ( data ) {

    if ( data.length === 0 ) {
      editView.get('memo__items').remove();
      editView.updateElement({ memo__items : '.memo-item'});
      return;
    };

    var
      data     = { list : data }
    , tmpl     = customer.db.getHtml('template/user.memo.html')
    , complied = _.template( tmpl )
    ;

    editView.get('memo__items').remove();
    editView.get('memo__list').append( complied(data) );

    editView.updateElement({ memo__items : '.memo-item'});

    componentHandler.upgradeElement( editView.get('memo__list').get(0) );

  };



  initModule = function () {

    // コンテンツの挿入
    $('.main-contents--edit-usr').append( customer.db.getHtml('edit.user.html'));

    // ビュー管理インスタンス
    editView = new Controller('.main-contents--edit-usr');
    editView.initElement( elements );

    // イベント登録
    editView.addListener({
      'click btn__back'         : backUserTable,
      'click btn__add-memo'     : _openMemoDialog,
      'click memo__items'       : _selectMemo,
      'change btn__filter-memo' : _filterMemo
    });


  };

  cms.view.editUsrs = {
    initModule : initModule,
    makeMemos  : makeMemos,
    clearFilter : clearFilter
  };

}( jQuery, customer ));