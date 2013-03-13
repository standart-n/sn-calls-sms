// Generated by CoffeeScript 1.5.0

exports.index = function(req, res) {
  var cn, colors, rmAllMessages;
  cn = global.appsettings;
  colors = global.controls.lib.colors.init();
  rmAllMessages = function() {
    return global.controls.client.connect(cn, function(client) {
      return global.controls.client.rmAllMessages(client, cn);
    });
  };
  return global.controls.client.connect(cn, function(client) {
    return global.controls.client.getAllMessages(client, cn, function(ms) {
      return global.controls.db.opendb(function(db) {
        return ms.filter(function(value, i) {
          return global.controls.client.insertMessageIntoBase(value, cn, db, function(res) {
            console.log('insert:'.info, i.toString().data, value.phone.data, value.text.data);
            if (parseInt(i) === parseInt(ms.length - 1)) {
              global.controls.db.disconnect(db);
              return rmAllMessages();
            }
          });
        });
      });
    });
  });
};
