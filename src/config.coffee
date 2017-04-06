# config.coffee, vadsll/src/
path = require 'path'

# static config

# paths
_BIN_ROUTE_FILTER = 'route_filter'  #  dist/route_filter
_CONFIG_FILE = 'config.json'        #  etc/config.json
_LOCAL_INSTALL_PREFIX = '/usr/local/'
# paths (installed to /usr/local/)
_PATH_LOCAL_DIST = '/usr/local/lib/vadsll/'
_PATH_LOCAL_ETC = '/usr/local/etc/vadsll/'
_PATH_LOCAL_LOG = '/var/log/vadsll/'
# paths (not installed, from this file: `config.js`)
_PATH_DIST = '../'        #  dist/vadsll/config.js
_PATH_ETC = '../../etc/'  #  etc/config.json
_PATH_LOG = '../../tmp/'  #  tmp/

LOG_SERVER_RES_OK    = 'server_res.OK.json'
LOG_SERVER_RES_ERR   = 'server_res.err.json'
# $ sudo nft -f setup.nft
LOG_NFT_SETUP        = 'setup.nft'
LOG_NFT_RESET        = 'nft_reset.sh'
LOG_PID_KEEP_ALIVE   = 'keep_alive.pid'
LOG_PID_ROUTE_FILTER = 'route_filter.pid'
LOG_SERVER_MSG_TMP   = 'server_msg.gbk'

LOG_FILE_LIST = [
  LOG_SERVER_RES_OK
  LOG_SERVER_RES_ERR
  LOG_NFT_SETUP
  #LOG_NFT_RESET
]
LOG_OLD_PATH = 'old'


_is_local_installed = ->
  d = path.resolve __dirname
  if d.startsWith _LOCAL_INSTALL_PREFIX
    return true
  false

_path_pretty_print = (raw) ->
  path.relative path.resolve('.'), raw

# global data
_gd = {
  # config.json data
  config_data: null

  # if this process is running in --slave mode
  slave: false
}

set_config = (data) ->
  _gd.config_data = data
get_config = ->
  _gd.config_data

get_log_path = ->
  if _is_local_installed()
    path.normalize _PATH_LOCAL_LOG
  else
    _path_pretty_print path.join(__dirname, _PATH_LOG)

get_route_filter_bin = ->
  if _is_local_installed()
    path.normalize path.join(_PATH_LOCAL_DIST, _BIN_ROUTE_FILTER)
  else
    _path_pretty_print path.join(__dirname, _PATH_DIST, _BIN_ROUTE_FILTER)

FLAG_SLAVE = '--slave'

set_slave = (slave) ->
  _gd.slave = slave
is_slave = ->
  _gd.slave


module.exports = {
  LOG_SERVER_RES_OK
  LOG_SERVER_RES_ERR
  LOG_NFT_SETUP
  LOG_NFT_RESET
  LOG_PID_KEEP_ALIVE
  LOG_PID_ROUTE_FILTER
  LOG_SERVER_MSG_TMP

  LOG_FILE_LIST
  LOG_OLD_PATH

  set_config
  get_config
  get_log_path
  get_route_filter_bin

  FLAG_SLAVE
  set_slave
  is_slave
}
