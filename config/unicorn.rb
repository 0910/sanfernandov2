# set path to application
app_root = "/home/ubuntu/applications/sanfernandov2/current"
shared_path = "/home/ubuntu/applications/sanfernandov2/shared"
working_directory app_root

# Logging
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

# Set up socket location
listen "/tmp/unicorn.sanfernandov2.sock", :backlog => 64

# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set master PID location
pid "#{app_root}/shared/pids/unicorn.sanfernandov2.pid"
