# app_path = File.expand_path('../../../', __FILE__)

# worker_processes 1

# working_directory "#{app_path}/current"
RAILS_ROOT = File.expand_path('../../', __FILE__)
ENV['BUNDLE_GEMFILE'] = RAILS_ROOT + "/Gemfile"
# ここは、RIALS_ROOTが記載されていれば、明示的にかかなくても大丈夫です。
# 自分が使っている環境でも、下の記載なしにちゃんと動いてますね。
working_directory RAILS_ROOT

pid "#{RAILS_ROOT}/shared/tmp/pids/unicorn.pid"
listen "#{RAILS_ROOT}/shared/tmp/sockets/unicorn.sock"
stderr_path "#{RAILS_ROOT}/shared/log/unicorn.stderr.log"
stdout_path "#{RAILS_ROOT}/shared/log/unicorn.stdout.log"

timeout 60

preload_app true
GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  if run_once
    run_once = false # prevent from firing again
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
