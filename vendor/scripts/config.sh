set -eu

export VENDOR=`git rev-parse --show-toplevel`/vendor
export PATH=$VENDOR/local/bin:$PATH
