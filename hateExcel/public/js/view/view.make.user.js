/**
 * ユーザー作成
 */


(function ($, cms) {
  let
    makeUserView,
    elements = {
      btn: {
        ok: '.btn--ok',
        cancel: '.btn--cancel',
        exec: '.btn--exec',
        close: '.btn--close',
      },
      select: {
        system: '.select-system',
        version: '.select-version',
        server: '.select-server',
        kid: '.select-kid',
      },
      'server-title': '.select-name.server',
      'version-title': '.select-name.version',
      'kid-title': '.select-name.kid',
      dialog: {
        confirm: '#make-usr-confirm',
        complete: '#complete-make-user',
        kid: '#complete-make-user .kid',
      },
    },
    _openDialog,
    _openCompleteDialog,
    _closeComplteDialog,
    _setInfoDialog,
    _makeSelectServer,
    _selectSystem,
    _makeUser,
    _clear,
    initModule;

  _openConfirm = function () {
    makeUserView.get('dialog__confirm').get(0).showModal();
  };

  _openCompleteDialog = function (data) {
    // 画面更新
    cms.view.homeNotices.refresh();
    cms.view.kids.refresh();

    _setInfoDialog(data);

    makeUserView.get('dialog__complete').get(0).showModal();
  };

  _closeComplteDialog = function () {
    makeUserView.get('dialog__complete').get(0).close();
  };

  _setInfoDialog = function (data) {
    makeUserView.get('dialog__kid').text(data.kid);
  };

  _makeOption = function (select, placeholder, options) {
    const ini = `<option value='' disabled selected style='display:none;'>${placeholder}</option>`;
    $(select).empty().append(ini);

    _.each(options, (v, k) => {
      $(select).append($('<option>', {
        value: v,
        text: v,
      }));
    });
  };

  _selectSystem = function () {
    const
      system_type = $(this).val();
    versions = _.chain(cms.model.environments.find({ system_type }))
      .pluck('version')
      .value()
    ;

    // バージョン選択肢を作成する
    _makeOption(
      makeUserView.get('select__version'),
      'バージョンを選択してください',
      versions,
    );

    _clear();

    if (system_type === 'onpre') {
      makeUserView.get('select__server').addClass('is-hidden');
      makeUserView.get('server-title').addClass('is-hidden');

      makeUserView.get('select__version').removeClass('is-hidden');
      makeUserView.get('version-title').removeClass('is-hidden');

      makeUserView.get('select__kid').removeClass('is-hidden');
      makeUserView.get('kid-title').removeClass('is-hidden');

      return;
    }

    if (system_type === 'docomo') {
      makeUserView.get('select__server').addClass('is-hidden');
      makeUserView.get('server-title').addClass('is-hidden');

      makeUserView.get('select__version').addClass('is-hidden');
      makeUserView.get('version-title').addClass('is-hidden');

      makeUserView.get('select__kid').addClass('is-hidden');
      makeUserView.get('kid-title').addClass('is-hidden');
      return;
    }

    makeUserView.get('select__server').removeClass('is-hidden');
    makeUserView.get('server-title').removeClass('is-hidden');

    makeUserView.get('select__version').removeClass('is-hidden');
    makeUserView.get('version-title').removeClass('is-hidden');

    makeUserView.get('select__kid').addClass('is-hidden');
    makeUserView.get('kid-title').addClass('is-hidden');
  };

  _makeSelectServer = function () {
    const version = $(this).val();
    let list_option = [{ name: '' }];
    list_option = _.union(list_option, customer.model.servers.find({ version, type: 'AP' }));
    util.addOption(list_option, makeUserView.get('select__server'), true);
  };

  _makeUser = function () {
    let
      kid = makeUserView.get('select__kid').val(),
      system_type = makeUserView.get('select__system').val(),
      version = makeUserView.get('select__version').val(),
      server = makeUserView.get('select__server').val(),
      environment,
      env_id,
      param,
      check_kid;
    if (system_type === 'docomo') {
      version = 'LM';
    }

    environment = customer.model.environments.find({
      system_type,
      version,
    });

    if (environment.length === 0) {
      makeUserView.get('select__system').addClass('is-error');
      makeUserView.get('select__version').addClass('is-error');
      return;
    }

    env_id = environment[0].id;

    // KID入力内容のチェック
    if (kid !== '' && !kid.match(/^[0-9]+$/)) {
      makeUserView.get('select__kid').addClass('is-error');
      return;
    }

    // 重複KIDチェック
    check_kid = customer.db.select('/isUnique/kid', { kid });
    if (check_kid[0] && check_kid[0].kid === kid) {
      makeUserView.get('select__kid').addClass('is-error');
      return;
    }

    param = {
      data: {
        kid: (kid === '') ? null : kid,
        system_type,
        version,
        environment_id: env_id,
        server,
      },
    };

    // KID, Userkey, DB Passwordを決める
    customer.db.post('/makeUser', param)
      .then((r) => {
        _openCompleteDialog(r);
      })
      .then(() => {
        _clear();
      })
      .catch((err) => {
        customer.view.dialogAlert.open(err.responseJSON.message);
      });
  };

  _clear = function () {
    // 入力されたKIDを消す
    makeUserView.get('select__kid').val('');

    _.each(makeUserView.get('select'), (val, key) => {
      $(val).removeClass('is-error');
    });
  };

  initModule = function () {
    $('.main-contents--mk-usr').append(customer.db.getHtml('html/make.user.html'));

    makeUserView = new Controller('.main-contents--mk-usr');

    // ダイアログ作成
    util.confirm({
      selector: '.main-contents--mk-usr',
      id: 'make-usr-confirm',
      msg: 'ユーザーを作成しますか？',
      yes: _makeUser,
    });

    makeUserView.initElement(elements);

    // システムの選択肢を作成する
    _.each(cms.model.environments.getNames(), (v, k) => {
      const el = $('<option>', {
        text: v,
        val: cms.model.environments.find({ name: v })[0].system_type,
      });
      makeUserView.get('select__system').append(el);
    });

    makeUserView.addListener({
      'click btn__ok': _openConfirm,
      'click btn__close': _closeComplteDialog,
      'change select__system': _selectSystem,
      'change select__version': _makeSelectServer,
    });
  };

  // to public
  cms.view.makeUser = {
    initModule,
  };
}(jQuery, customer));
