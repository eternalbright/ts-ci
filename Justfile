set dotenv-load

BUILD_DIR := env_var_or_default('BUILD_DIR', '..')
PACKAGE_FILE_PATH := BUILD_DIR / 'package.json'

build-nest:
	docker build \
		-f Dockerfile.nest {{ BUILD_DIR }} \
		-t `jq -r '.name' {{ PACKAGE_FILE_PATH }}`:`jq -r '.version' {{ PACKAGE_FILE_PATH }}` \
		--no-cache
