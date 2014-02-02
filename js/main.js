var bowser = require('bowser').browser;

if (bowser.android || bowser.iphone || bowser.ipad || bowser.touchpad) {
    var hash = window.location.hash;
    window.location.href = 'pairup/mobile.html' + hash;
}

if (bowser.msie) {
    window.location.href = 'pairup/unsupported.html';
}