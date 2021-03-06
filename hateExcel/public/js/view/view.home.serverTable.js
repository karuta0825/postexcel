/**
 * homeのサーバーごとの
 * ユーザー収容可能表
 */

(function ($, cms) {
  let
  // member
    homeView,
    elements = {
      select: '.article__header select',
      table: {
        title: '.article-servers-table .article__title',
        body: '.article-servers-table .servers-table-wrap',
      },
    },
    // private
    // public
    initModule,
    drawTable,
    refresh;

  drawTable = function (data) {
    var
      data = { list: data },
      tmpl = customer.db.getHtml('template/home.serverTable.html'),
      complied = _.template(tmpl);
    homeView.get('table__body').empty();
    homeView.get('table__body').append(complied(data));
  };

  changeView = function (version) {
    cms.model.homeServerTable.find({ version }, drawTable);
  };

  refresh = function () {
    cms.model.homeServerTable.fetch(null, () => {
      changeView('LM');
    });
  };

  initModule = function () {
    homeView = new Controller('.home-wrapper__center');
    homeView.initElement(elements);

    cms.model.homeServerTable.find({ version: 'LM' }, drawTable);

    homeView.get('select').change(function (e) {
      changeView($(this).val());
    });
  };


  cms.view.homeServerTable = {
    initModule,
    drawTable,
    refresh,
  };
}(jQuery, customer));
