/**
 * グラフ
 */

(function ($, cms) {
  let
  // member
    viewGraph,
    elements = {
      btn: {
        prev: '.btn--prev',
        next: '.btn--next',
        'this-month': '.btn--this-month',
        download: '.btn--download',
      },
      LM: '.article__body .lm',
      ES: '.article__body .es',
    },
    timer = false,
    resize_chart = {},
    resize_options = {},
    resize_data = {},
    // private method
    _next,
    _prev,
    _download,
    // public method
    initModule,
    draw,
    refresh,
    pushThisMonth;

  _next = function () {
    cms.model.homeGraph.get('next', () => {
      draw('LM');
      draw('ES');
    });
  };

  _prev = function () {
    cms.model.homeGraph.get('prev', () => {
      draw('LM');
      draw('ES');
    });
  };

  _thisMonth = function () {
    cms.model.homeGraph.get('this_month', () => {
      draw('LM');
      draw('ES');
    });
  };

  _download = function () {
    let
      file_name = `${new moment().format('YYYYMMDD')}_addInfo.csv`,
      downloadMap,
      csv_header = ['月', 'ユーザ', 'ユーザ数(CitrixID数)', 'クライアント数(FENICSID数)', 'バージョン'],
      blob;
    downloadMap = cms.model.homeGraph.getCache();

    blob = util.convertMap2Blob(downloadMap, csv_header);

    util.downloadFile(this, blob, file_name);
  };

  draw = function (version) {
    const list_data = cms.model.homeGraph.find(version);

    resize_data[version] = google.visualization.arrayToDataTable(list_data);

    resize_options[version] = {
      title: version,
      hAxis: { title: '月' },
      legend: { position: 'bottom' },
      colors: ['#7575ff', '#ff5b94', '#ffb600'],
    };

    resize_chart[version] = new google.visualization.ColumnChart(viewGraph.get(version).get(0));
    resize_chart[version].draw(resize_data[version], resize_options[version]);
  };

  initModule = function () {
    google.charts.load('visualization', '1', { packages: ['corechart'] });

    viewGraph = new Controller('.article-graph');

    viewGraph.initElement(elements);

    // draw
    google.charts.setOnLoadCallback(() => {
      draw('LM');
      draw('ES');
    });

    // windowリサイズ時にグラフ長さ調整
    $(window).resize(() => {
      if (timer !== false) {
        clearTimeout(timer);
      }
      timer = setTimeout(() => {
        console.log('resized');
        resize_chart.LM.draw(resize_data.LM, resize_options.LM);
        resize_chart.ES.draw(resize_data.ES, resize_options.ES);
      }, 200);
    });

    viewGraph.addListener({
      'click btn__prev': _prev,
      'click btn__next': _next,
      'click btn__this-month': _thisMonth,
      'click btn__download': _download,
    });
  };

  refresh = function () {
    cms.model.homeGraph.refresh(draw);
  };

  pushThisMonth = function () {
    viewGraph.get('btn__this-month').click();
  };

  // to public
  cms.view.homeGraph = {
    initModule,
    refresh,
    pushThisMonth,
  };
}(jQuery, customer));
