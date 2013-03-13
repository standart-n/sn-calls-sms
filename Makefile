
DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#


#
# BUILD DOCS
#

def: all

all: folders server finish

server: app-js controls-js routes-js



controls-js:
	@echo "\ncontrols...\n"
	@rm -fR ./public/js/controls
	@mkdir -p ./public/js/controls
	@coffee -o ./public/js/controls -cb ./node_controls/

routes-js:
	@echo "\nroutes...\n"
	@rm -fR ./public/js/routes
	@mkdir -p ./public/js/routes
	@coffee -o ./public/js/routes -cb ./node_routes/

app-js:
	@echo "\napp...\n"
	@coffee -cbjvp ./script/app*.coffee > ./app

start:
	@echo "forever start -o ./log/out.log -e ./log/err.log app"
	@forever start -o ./log/out.log -e ./log/err.log app

stop:
	@echo "stop app"
	@forever stop app




folders:
	@mkdir -p ./public/img
	@mkdir -p ./public/css
	@mkdir -p ./public/materials
	@mkdir -p ./public/files
	@mkdir -p ./public/js/client
	@mkdir -p ./public/js/controls
	@mkdir -p ./public/js/routes
	@mkdir -p ./public/js/tpl
	
finish:
	@echo "\nSuccessfully built at ${DATE}."

#
# RUN JSHINT & QUNIT TESTS IN PHANTOMJS
#

#.PHONY: docs watch gh-pages
