var bowser = require('bowser').browser;

if (bowser.android || bowser.iphone || bowser.ipad || bowser.touchpad) {
    var hash = window.location.hash;
    window.location.href = '/mobile.html' + hash;
}

if (bowser.msie) {
    window.location.href = '/unsupported.html';
}