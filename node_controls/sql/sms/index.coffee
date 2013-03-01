
exports.insertMessageIntoBase = (data, cn) ->
	table = cn.tables.messages.name
	fields = cn.tables.messages.fields

	'insert into ' + table + ' ' +
	'(' + fields.index + ',' + fields.sim + ',' + fields.phone + ',' + fields.date + ',' + fields.text + ') values ' +
	'('+ 'data.index' + ',' + 'data.sim' + ',' + 'data.phone' + ',' + 'data.date' + ',' + 'data.text' + ')'
