require "bundler/gem_tasks"
require "rake/testtask"

project_name = "agile_utils"

Rake::TestTask.new do |t|
  t.libs << "lib/#{project_name}"
  t.test_files = FileList["test/lib/#{project_name}/test_*.rb"]
  t.verbose = true
end
task default: :test
task :pry do
  require "pry"
  require "awesome_print"
  require_relative "lib/agile_utils"
  include AgileUtils
  ARGV.clear
  Pry.start
end

require "rubocop/rake_task"
desc "Run RuboCop on the lib directory"
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ["lib/**/*.rb"]
  task.formatters = ["files"]
  task.fail_on_error = false
end
