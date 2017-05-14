/**
 * ネットワーク情報モデル
 */

( function ( $, cms ) {

  var
    _model = new Model({
      'table' : 'fenics'
    })
  ;

  cms.model.userNetwork = {
    fetch : $.proxy( _model.fetch, _model ),
    getCache : $.proxy( _model.getCache, _model)
  };

}( jQuery, customer ));
