//
const MainMenu = require('./MainMenu').MainMenu;

const entryPoint = '.main-contents--reg-usr';
const elements = {
  upload: '.upload',
  btn: {
    upload: '.btn--upload',
  },
  alert: '#modal-alert-register',
  finish: '#modal-finish-register',
};

class RegistUser extends MainMenu {
  constructor(driver, by, until) {
    super(driver, by, until, entryPoint);
    super.initElements(elements);
  }

  // ここは特別のクラスを作ったほうがいいね
  isActive() {
    return super.getEntryDom().getAttribute('class')
      .then(r => r.match(/is-active/) !== null);
  }
}

exports.RegistUser = RegistUser;
