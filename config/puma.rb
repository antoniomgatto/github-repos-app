workers ENV.fetch("WEB_CONCURRENCY") { 2 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

before_fork do
  @sidekiq_pid ||= spawn('bundle exec sidekiq -c 2 -t 25')
end

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

on_restart do
  Sidekiq.redis.shutdown { |conn| conn.close }
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
