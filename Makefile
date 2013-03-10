all: ready

ready:
	@git pull
	@git submodule update --init --recursive
	@bundle check 2>&1 >/dev/null || { bundle --local --path vendor/bundle > /dev/null && bundle check; }
