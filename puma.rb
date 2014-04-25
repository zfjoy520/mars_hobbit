APP_ROOT = '/hobbit/mars'
environment 'production'

#bind "unix://#{APP_ROOT}/tmp/sockets/puma.sock"
bind "tcp://127.0.0.1:9292"
pidfile "#{APP_ROOT}/tmp/pids/puma.pid"
state_path "#{APP_ROOT}/tmp/pids/puma.state"
daemonize true
workers 4
threads 160,160
preload_app!