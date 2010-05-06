# encoding: utf-8

require 'rake'
require 'yaml'

require 'rake/rdoctask'
require 'rspec/core/rake_task'
require 'rspec/core/version'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "custom_validators"
    gem.summary = %Q{An ever growing collection for custom validators for ActiveModel 3.0}
    gem.description = %Q{An ever growing collection for custom validators for ActiveModel 3.0}
    gem.email = "tarsolya@gmail.com"
    gem.homepage = "http://github.com/tarsolya/custom_validators"
    gem.authors = ["Tarsoly András"]
    gem.add_development_dependency "rspec", "~> 2.0.0"
    gem.add_development_dependency "activemodel", "~> 3.0.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

Rspec::Core::RakeTask.new(:spec)

Rspec::Core::RakeTask.new(:rcov) do |spec|
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "custom_validators #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
