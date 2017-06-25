/**
 * グラフ
 */

( function ( $, cms ) {

  var
  // member
    viewGraph
  , elements = {
      'LM' : '.article__body .lm',
      'ES' : '.article__body .es'
    }
  , timer = false
  , resize_chart = {}
  , resize_options = {}
  , resize_data = {}
  // public method
  , initModule
  , draw
  , redraw
  ;

  draw = function () {

    google.charts.setOnLoadCallback(
      function() {

        // LM
        draws('LM')

        // ES
        draws('ES')

      }
    );

  };

  draws = function (version) {

    var list_data = _.where( customer.db.select('/select',{'table' : 'get_add_info_in_each_month'}), {version: version});

    list_data = _.map(list_data, function (v,k) {
      delete v.version;
      return v;
    });

    list_data = _.map( list_data, function ( v,k ) {
      return _.values(v);
    });

    list_data.unshift(['','ユーザ','クライア ント', 'PC']);

    resize_data[version] = google.visualization.arrayToDataTable(list_data);

    resize_options[version] = {
      title: version,
      hAxis: {title: '月'},
      legend:{position:'bottom'}
    };

    resize_chart[version] = new google.visualization.ColumnChart(viewGraph.get(version).get(0));
    resize_chart[version].draw(resize_data[version], resize_options[version]);

  };

  redraw = function () {
    var model = _.where( customer.db.select('/select',{'table' : 'get_add_info_in_each_month'}), {version:'ES'});

    model = _.map(model, function (v,k) {
      delete v.version;
      return v;
    });

    model = _.map( model, function ( v,k ) {
      return _.values(v);
    });

    draw( model, ['','ユーザ','クライア ント', 'PC']);

  };

  initModule = function () {

    google.charts.load("visualization", "1", {packages:["corechart"]});

    viewGraph = new Controller('.article-graph');

    viewGraph.initElement(elements);

    var model = _.where( customer.db.select('/select',{'table' : 'get_add_info_in_each_month'}), {version:'LM'});

    model = _.map(model, function (v,k) {
      delete v.version;
      return v;
    });

    model = _.map( model, function ( v,k ) {
      return _.values(v);
    });

    draw( model, ['','ユーザ','クライア ント', 'PC']);

    // windowリサイズ時にグラフ長さ調整
    $(window).resize(function() {
        if (timer !== false) {
            clearTimeout(timer);
        }
        timer = setTimeout(function() {
            console.log('resized');
            resize_chart.draw( resize_data, resize_options )
        }, 200);
    });

  };


  // to public
  cms.view.homeGraph = {
    initModule : initModule,
    empty : function () { viewGraph.get('lm').empty(); },
    get : function () { resize_chart.draw(resize_data, resize_options); },
    redraw : redraw
 
  };

}( jQuery, customer ));