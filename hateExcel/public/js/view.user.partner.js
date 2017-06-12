/**
 * パートナー情報
 */

( function ( $, cms ) {

  var
    partnerView
  , elements = {
      'btn' : {
        'edit'       : '.btn--edit',
        'cancel'     : '.btn--cancel',
        'save'       : '.btn--save',
      },
      'input' : {
        'sa_pid'        : '.sa_pid',
        'sa_company'    : '.sa_company',
        'sa_postal_cd'  : '.sa_postal_cd',
        'sa_address'    : '.sa_address',
        'sa_affliation' : '.sa_affliation',
        'sa_name'       : '.sa_name',
        'sa_tel'        : '.sa_tel',
        'sa_fax'        : '.sa_fax',
        'sa_email'      : '.sa_email',
        'se_pid'        : '.se_pid',
        'se_company'    : '.se_company',
        'se_postal_cd'  : '.se_postal_cd',
        'se_address'    : '.se_address',
        'se_affliation' : '.se_affliation',
        'se_name'       : '.se_name',
        'se_tel'        : '.se_tel',
        'se_fax'        : '.se_fax',
        'se_email'      : '.se_email',
        'em_company'    : '.em_company',
        'em_name'       : '.em_name',
        'em_tel'        : '.em_tel',
        'em_email'      : '.em_email'
      },
      'alert' : '#save-alert'
    }
  , _validate
  , cancel
  , save
  , edit
  , reset
  , setInfo
  , getViewInfo
  , clear
  , initModule
  ;

  _validate = function ( list_key ) {

    _.each( partnerView.get('input'), function (val, key){
      val.find('.item-value').removeClass('is-error');
    });

    if ( list_key.length !== 0 ) {

      _.each( list_key, function ( v,k ) {
        partnerView.get('input__' + v )
          .find('.item-value')
          .addClass('is-error');
      });

      partnerView.get('alert').get(0).showModal();

      return true;

    }

    return false;

  };

  cancel = function () {

    _.each( partnerView.get('input'), function (val, key){
      val.find('.item-value').removeClass('is-edit');
      val.find('.item-value').prop('disabled', true);
    });

    partnerView.get('btn__edit').removeClass('is-hidden');
    partnerView.get('btn__cancel').addClass('is-hidden');
    partnerView.get('btn__save').addClass('is-hidden');

    reset();

  };

  save = function () {

    var error = cms.model.userPartner.check( getViewInfo() );
    if ( _validate(error) ) {
      return;
    };

    // update
    customer.model.userPartner.update( getViewInfo(), setInfo );

    // 編集不可
    _.each( partnerView.get('input'), function (val, key){
      val.find('.item-value').removeClass('is-edit');
      val.find('.item-value').prop('disabled', true);
    });

    // ボタン状態制御
    partnerView.get('btn__edit').removeClass('is-hidden');
    partnerView.get('btn__cancel').addClass('is-hidden');
    partnerView.get('btn__save').addClass('is-hidden');


  };

  edit = function () {

    _.each( partnerView.get('input'), function (val, key){
      val.find('.item-value').addClass('is-edit');
      val.find('.item-value').prop('disabled', false);
    });

    partnerView.get('btn__edit').addClass('is-hidden');
    partnerView.get('btn__cancel').removeClass('is-hidden');
    partnerView.get('btn__save').removeClass('is-hidden');

  };

  reset = function () {

    _.each( partnerView.get('input'), function (val, key){
      val.find('.item-value').removeClass('is-error');
    });

    customer.model.userPartner.getCache( setInfo );
  };

  setInfo = function ( data ) {

    var data = _.isArray( data ) ? data[0] : data;

    _.each( partnerView.get('input'), function (v,k) {
      v.find('.item-value').val( data[k]);
    });

  };

  getViewInfo = function () {

    var result = {};

    _.each( partnerView.get('input'), function (v,k) {
      result[k] = v.find('.item-value').val();
    });

    return result;

  };

  clear = function () {

    _.each( partnerView.get('input'), function (v,k) {
      v.find('.item-value').val('');
    });

  };

  initModule = function () {
    // View挿入
    $('#usr-partner-panel')
    .append( customer.db.getHtml('template/user.partner.html'));

    partnerView = new Controller('#usr-partner-panel');

    util.alert({
      selector : partnerView.top,
      id       : 'save-alert',
      msg      : '入力に誤りがあります'
    });

    // View管理定義
    partnerView.initElement( elements );

    // Event定義
    partnerView.addListener({
      'click btn__edit'   : edit,
      'click btn__cancel' : cancel,
      'click btn__save'   : save
    });

  };

  // to public
  cms.view.userPartner = {
    initModule  : initModule,
    setInfo     : setInfo,
    clear       : clear,
    getViewInfo : getViewInfo,
    get : function () { return partnerView; }
  }

}( jQuery, customer ))