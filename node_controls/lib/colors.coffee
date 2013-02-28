
exports.init = () ->

	colors = require 'colors'
	
	setColorTheme = (colors) ->
		colors.setTheme
			silly: 'rainbow'
			input: 'grey'
			verbose: 'cyan'
			prompt: 'grey'
			info: 'green'
			data: 'grey'
			help: 'cyan'
			warn: 'yellow'
			debug: 'blue'
			error: 'red'

	setColorTheme colors

	colors