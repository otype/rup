require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'rup'
    gem.summary = 'SCM Repository manager for SVN, GIT and REPO, made in Ruby'
    gem.description = 'Manage multiple SCM repositories at different locations of various types (SVN, GIT, REPO) with one simple CLI tool.'
    gem.email = 'hans@otype.de'
    gem.rubyforge_project = 'rup'
    gem.authors = ['Hans-Gunther Schmidt']
    gem.extra_rdoc_files = ['README', 'LICENSE', 'TODO']
    gem.executables = ['rup']
    gem.homepage = 'http://rup.otype.de/'
    gem.executables = ['rup']
  end
  
  Jeweler::GemcutterTasks.new
  
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rup #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
