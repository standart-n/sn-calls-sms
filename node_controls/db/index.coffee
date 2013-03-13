
exports.opendb = (callback) ->

	colors = global.controls.lib.colors.init()
	fb = global.controls.lib.fb.init()
	conf = global.dbsettings.connections.fdb

	fb.attach
		host: conf.path.replace(/^(.*?)\:(.*)/i,'$1')
		database: conf.path.replace(/^(.*?)\:(.*)/i,'$2')
		user: conf.login
		password: conf.password
		(err, db) ->
			if (err)
				console.log 'firebird:'.error, err.message.data
			else
				console.log 'firebird:'.info, 'connected to base'.data
				callback(db)

exports.query = (sql, db, callback) ->
	colors = global.controls.lib.colors.init()
	db.query sql, (err, result) ->
		if err 
			console.log 'firebird:'.error, err.message.data
		else 
			callback(result)

exports.checkError = (err) ->
	colors = global.controls.lib.colors.init()
	console.log 'firebird:'.error, err.message.data if err

exports.check = (tr, callback) ->
	colors = global.controls.lib.colors.init()
	(err, param) ->
		if (!err)
			callback err, param
		else
			tr.rollback()
			console.log 'firebird:'.error, err.message.data