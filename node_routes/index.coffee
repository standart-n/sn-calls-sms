
exports.index = (req, res) ->

	cn = global.appsettings
	colors = global.controls.lib.colors.init()

	# global.controls.db.opendb (db) ->
	# 	db.query global.controls.sql.getUserList(), (err, result) ->
	# 		console.log(result)


	# socket = io.connect(cn.ip+':'+cn.port)


	global.controls.client.connect cn, (client) ->
		global.controls.client.getAllMessages client, cn, (data) ->
			global.controls.db.opendb (db) ->
				global.controls.client.insertMessageIntoBase data[0], cn, db, (res) ->

	console.log global.controls.sql.sms.insertMessageIntoBase {}, cn

			# console.log data





