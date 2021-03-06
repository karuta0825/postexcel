/**
 * viewController
 * サーバー情報
 */
(function ($, cms) {
  let
  // member
    idx = 0,
    view = {},
    elements = {
      select: {
        version: '.select-version',
        alert: '#modal-servers-alert',
      },
      common: {
        btn: {
          add: '.btn--add',
          cancel: '.btn--cancel',
          save: '.btn--save',
          del: '.btn--del',
        },
        body: '.setting__body',
        table: 'table',
        select_db: '.select-db',
        select_type: '.select-type',
      },
    },

    // private method
    _changeValue,
    _changeVersion,
    _toggleByType,
    _makeSelectBox,
    _makeInputWidthMaxLength,
    _setConnectDBValue,
    _onClickAdd,
    _onClickCancel,
    _onClickSave,
    _onClickDel,
    _drawTable,
    _makeRow,
    _validate,
    // public method
    redrawTable,
    initModule;

  _changeValue = function (evt) {
    const
      map_update = {
        id: $(evt.target).parents('tr').data('id'),
        key: $(evt.target).parents('td').attr('class'),
        value: $(evt.target).val(),
        version: $(evt.target).parents('.setting').data('version'),
      };
    cms.model.servers.updateItem(map_update);
  };


  _changeVersion = function (evt) {
    const version = $(this).val();

    if (version === 'LM') {
      view.LM.wrap.removeClass('is-hidden');
      view.ES.wrap.addClass('is-hidden');
    } else {
      view.ES.wrap.removeClass('is-hidden');
      view.LM.wrap.addClass('is-hidden');
    }
  };

  _toggleByType = function (evt) {
    let
      type = $(evt.target).val(),
      tr = $(evt.target).parents('tr');
    if (type === 'AP') {
      tr.find('.select-db').removeClass('is-hidden');
      tr.find('.domain input').addClass('is-hidden');
    } else if (type === 'DB') {
      tr.find('.select-db').addClass('is-hidden');
      tr.find('.domain input').removeClass('is-hidden');
    } else {
      tr.find('.select-db').addClass('is-hidden');
      tr.find('.domain input').addClass('is-hidden');
    }
  };


  /**
   * [_setConnectDBValue description]
   * @param {[type]} version
   * @todo : 表示制御しているので、関数名を変更したほうがいい
   */
  _setConnectDBValue = function (version) {
    let tr,
      item;

    tr = view[version].get('table').find('tbody tr');

    _.each(tr, (el, idx) => {
      item = cms.model.servers.find({ id: $(el).data('id') })[0];

      $(el).find('.select-db').val(item.connect_db);

      // 接続先DB入力不可
      if (item.type !== 'AP') {
        $(el).find('.select-db').addClass('is-hidden');
      }

      // DOMAIN入力不可
      if (item.type !== 'DB') {
        $(el).find('.domain input').addClass('is-hidden');
      }
    });
  };

  _makeSelectBox = function (version) {
    const data = cms.model.servers.find({ version, type: 'DB' });

    view[version].get('select_db').empty();
    view[version].get('select_db').append($('<option>'));

    _.each(data, (v, k) => {
      option = $('<option>', { value: v.name, text: v.name });
      view[version].get('select_db').append(option);
    });

    _setConnectDBValue(version);
  };


  _makeRow = function (version) {
    // DOM要素生成
    let
      tr = $('<tr>', { 'data-id': `c${idx}` }),
      td_type = $('<td>', { class: 'type' }),
      td_name = $('<td>', { class: 'name' }),
      td_ip = $('<td>', { class: 'ip' }),
      td_con_db = $('<td>', { class: 'connect_db' }),
      td_capacity = $('<td>', { class: 'capacity' }),
      td_domain = $('<td>', { class: 'domain' }),
      td_del = $('<td>', { align: 'center', class: 'del' }),
      input = $('<input>', { type: 'text' }),
      input_num = $('<input>', { type: 'number' }),
      select_type = $('<select>', { class: 'select-type' }),
      select_db = $('<select>', { class: 'select-db' }),
      opt_ap = $('<option>', { value: 'AP', text: 'AP' }),
      opt_db = $('<option>', { value: 'DB', text: 'DB' }),
      opt_web = $('<option>', { value: 'WEB', text: 'WEB' }),
      button = $('<button>', { class: 'btn btn--del mdl-button mdl-js-button mdl-button--icon' }),
      icon = $('<i>', { class: 'material-icons', text: 'delete_forever' }),
      list_db = cms.model.servers.find({ version, type: 'DB' })
    ;

    // cidの管理もモデルにやってほしいものだ
    idx += 1;
    select_type
      .append(opt_ap)
      .append(opt_db)
      .append(opt_web);
    select_db.append($('<option>'));
    _.each(list_db, (v, k) => {
      select_db.append($('<option>', { value: v.name, text: v.name }));
    });

    td_type.append(select_type);
    td_name.append(_makeInputWidthMaxLength(10));
    td_ip.append($(input).clone(true));
    td_con_db.append(select_db);
    td_capacity.append(input_num);
    td_domain.append(_makeInputWidthMaxLength(45).attr('class', 'is-hidden'));
    td_del.append(button.append(icon));

    tr.append(td_type)
      .append(td_name)
      .append(td_ip)
      .append(td_con_db)
      .append(td_capacity)
      .append(td_domain)
      .append(td_del);
    return tr;
  };

  _makeInputWidthMaxLength = function (length, type) {
    type = (type) || 'text';
    return $('<input>', { type, maxlength: length });
  };

  _drawTable = function (data) {
    var
      version = data[0].version,
      data = { list: data },
      tmpl = customer.db.getHtml('template/servers.html'),
      complied = _.template(tmpl);
    view[version].get('body').append(complied(data));
    view[version].updateElement({ select_db: '.select-db' });
    view[version].updateElement({ select_type: '.select-type' });
    view[version].updateElement({ table: 'table' });
  };

  redrawTable = function (version) {
    view[version].get('body').empty();
    _drawTable(customer.model.servers.find({ version }));

    _makeSelectBox('LM');
    _makeSelectBox('ES');
  };


  _onClickSave = function (evt) {
    const version = $(evt.target).parents('.setting').data('version');
    const list = customer.model.servers.validate(version);

    // 保存終了まで連続でボタンクリックできないように
    view[version].get('btn__save').prop('disabled', true);

    if (!_validate(list, version)) {
      view.BASE.get('alert').get(0).showModal();
      view[version].get('btn__save').prop('disabled', false);
      return;
    }

    cms.model.servers.sendServer(version)
      .then(() => {
      // ユーザ一覧のサーバー選択肢を更新
        cms.view.kidsFilter.updateServerOption('all');

        // ホーム画面のサーバー収容表を更新
        cms.view.homeServerTable.refresh();

        // 本画面更新
        cms.view.servers.redrawTable(version);

        view[version].get('btn__save').prop('disabled', false);

        cms.view.dialogAlert.open('保存完了しました');
      })
      .catch((err) => {
        const msg = `保存に失敗しました ${err.responseJSON.message.code}`;
        view[version].get('btn__save').prop('disabled', false);
        cms.view.dialogAlert.open(msg);
      });
  };

  _onClickCancel = function (evt) {
    const version = $(evt.target).parents('.setting').data('version');
    redrawTable(version);
    _setConnectDBValue(version);
    cms.model.servers.resetItems();
  };

  _onClickAdd = function (evt) {
    let
      version = $(evt.target).parents('.setting').data('version'),
      row = _makeRow(version);

    view[version].get('body').find('table').append(row);
    cms.model.servers.insertItem({
      id: row.data('id'),
      type: 'AP',
      name: '',
      ip: '',
      connect_db: '',
      environment_id: (version === 'LM') ? 4 : 3,
      capacity: '',
      domain: '',
      version,
    });
  };

  _onClickDel = function (evt) {
    let
      tr = $(evt.target).parents('tr'),
      map = {
        id: tr.data('id'),
        version: $(evt.target).parents('.setting').data('version'),
      };
    tr.remove();

    // モデルに通知
    cms.model.servers.removeItem(map);
  };

  /**
   * [_validate description]
   * @param  {Array} list - 入力エラーのidとkeyを格納した配列の配列
   * 現在の状態を保持したほうがいいね
   */
  _validate = function (list, version) {
    let id,
      tr;

    // 初期化
    view[version].get('table').find('.name input').removeClass('is-error');
    view[version].get('table').find('.ip input').removeClass('is-error');
    view[version].get('table').find('.capacity input').removeClass('is-error');


    if (list.length !== 0) {
      _.each(list, (item, idx) => {
        id = item.shift();

        tr = view[version].get('table').find(`[data-id=${id}]`);

        _.each(item, (v, k) => {
          tr.find(`.${v}`).find('input').addClass('is-error');
        });
      });

      return false;
    }

    return true;
  };

  // initialize module
  initModule = function () {
    // 同期処理させる
    $('.main-contents--settings-servers').append(customer.db.getHtml('html/setting.servers.html'));

    view = {
      BASE: new Controller('.main-contents--settings-servers'),
      LM: new Controller('.setting--lm-servers'),
      ES: new Controller('.setting--es-servers'),
    };

    util.alert({
      selector: view.BASE.top,
      id: 'modal-servers-alert',
      msg: '入力に誤りがあります',
    });

    view.BASE.initElement(elements.select);
    view.LM.initElement(elements.common);
    view.ES.initElement(elements.common);

    _drawTable(customer.model.servers.find({ version: 'LM' }));
    _drawTable(customer.model.servers.find({ version: 'ES' }));

    _makeSelectBox('LM');
    _makeSelectBox('ES');


    view.BASE.addListener({
      'change version': _changeVersion,
    });

    view.LM.addListener({
      'click btn__add': _onClickAdd,
      'click btn__save': _onClickSave,
      'click btn__cancel': _onClickCancel,
      'click btn__del': _onClickDel,
      'change body': _changeValue,
      'change select_type': _toggleByType,
    });

    view.ES.addListener({
      'click btn__add': _onClickAdd,
      'click btn__save': _onClickSave,
      'click btn__cancel': _onClickCancel,
      'click btn__del': _onClickDel,
      'change body': _changeValue,
    });
  };

  // to public
  cms.view.servers = {
    initModule,
    validate: _validate,
    redrawTable,
  };
}(jQuery, customer));
