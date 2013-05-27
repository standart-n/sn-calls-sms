
exports.index = (req, res) ->

	cn = global.appsettings
	colors = global.controls.lib.colors.init()

	rmAllMessages = () ->
		global.controls.client.connect cn, (client) ->
			global.controls.client.rmAllMessages client, cn

	dt = new Date()

	console.log dt.toString().verbose

	global.controls.client.connect cn, (client) ->
		global.controls.client.getAllMessages client, cn, (ms) ->
			if global.program.firebird
				global.controls.db.opendb (db) ->
					ms.filter (value, i) -> 
						global.controls.client.insertMessageIntoBase value, cn, db, (res) ->
							console.log 'insert:'.info, i.toString().data, value.date.datetime.info, value.phone.data, value.text.data
							if parseInt(i)==parseInt(ms.length-1)
								# console.log 'disconnect'.info, parseInt(i).toString(), parseInt(ms.length-1).toString()
								global.controls.db.disconnect db
								if global.program.remove
									rmAllMessages()

	res.send 'standart-n' if res

		




