/**
 * ホームのカレンダー・イベント画面
 */

( function ( $, cms ) {

  var
  // member
    view
  , elements = {
      'btn' : {
        'next-month' : '.btn--next',
        'prev-month' : '.btn--prev'
      },
      'calendar' : {
        'self' : '.calendar',
        'body' : '.calendar .body',
        'month' : '.calendar .header .month'
      },
      'events'   : '.events'
    }
  , m = moment()
  , today = moment()
  // private method
  , _isLeapYear
  , _getCalender
  , _drawCalendar
  // public method
  , initModule
  ;

  /**
   *
   * @param  {Number} diff
   * @return {Object}
   */
  _getCalender = function ( diff ) {

    if ( diff && _.isNumber( diff) )  {
      m.add( diff, 'months')
    }

    var
      DAYS = ["日","月","火","水","木","金","土"]
    , year = m.year()
    , month = m.month() + 1
    , today = m.date()
    , day = m.day()
    , firstDay = m.date(1).day()
    , TblLine = Math.ceil( ( firstDay + m.daysInMonth() )/7 )
    , tableData = new Array( 7 * TblLine )
    ;

    for ( var i = 0; i < 7*TblLine; i++ ) {
      tableData[i] = ' ';
    }

    for ( var i = 0; i < m.daysInMonth(); i++ ) {
      // 初日の曜日分格納場所をずらす
      tableData[i+firstDay] = i + 1 ;
    }

    return { number_line : TblLine, data : tableData, weeks : DAYS, month : m.format('YYYY年MM月') };

  };

  _drawCalendar = function ( diff ) {

    // 初期化
    view.get('calendar__body').empty();

    var tableMap = _getCalender(diff);

    var
      table = $('<table>', { class : 'calendar-table'})
    , weekTr = $('<tr>')
    , td
    ;

    for ( var i = 0; i <7 ; i++ ) {
      weekTr.append( $('<td>', {
        text : tableMap['weeks'][i],
        class : 'table-data-center'
      }));
    }

    table.append(weekTr);

    for ( var i = 0; i < tableMap['number_line']; i++ ) {
      var tr = $('<tr>');
      for ( var j = 0; j < 7; j++ ) {
        tr.append( $('<td>', {
          text : tableMap['data'][j+(i*7)],
          class : 'table-data-center'
        }));
        table.append(tr);
      }

    }

    view.get('calendar__month').text( tableMap['month'] );
    view.get('calendar__body').append( table );


  };

  initModule = function () {

    view = new Controller('.article.article-calendar');

    view.initElement(elements);

    _drawCalendar();

    view.addListener({
      'click btn__prev-month' : function () { _drawCalendar(-1) },
      'click btn__next-month' : function () { _drawCalendar(1) }
    });

  };

  // to public
  cms.view.homeCalendar = {
    initModule : initModule,
    get : _getCalender
  };

} ( jQuery, customer ))