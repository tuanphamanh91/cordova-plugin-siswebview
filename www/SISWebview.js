var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'SISWebview', 'coolMethod', [arg0]);
};

exports.removeWebview = function (arg0, success, error) {
    exec(success, error, 'SISWebview', 'removeWebview', [arg0]);
};

