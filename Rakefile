require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "simple_sinatra"
    gem.summary = %Q{A sinatra_code Sinatra application}
    gem.description = %Q{Demo Sinatra for the Ruby Meetup}
    gem.email = "techwhizbang@gmail.com"
    gem.homepage = "http://techwhizbang.com"
    gem.authors = ["Nick Zalabak"]
    gem.add_development_dependency "rspec", ">= 1.3.0"
    gem.add_development_dependency "rack-test", ">= 0.5.3"
    gem.add_dependency "sinatra", "1.0"
    gem.add_dependency "rack", ">= 1.1.0"
    gem.add_dependency "haml", ">= 3.0.13"
    gem.add_dependency "builder", ">= 2.1.2"
    gem.add_dependency "erubis", ">= 2.6.6"
    gem.add_dependency "json"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

# Uncomment this is you want to run TestUnit instead
#require 'rake/testtask'
#Rake::TestTask.new(:test) do |test|
#  test.libs << 'test'
#  test.pattern = 'test/**/test_*.rb'
#  test.verbose = true
#end

# Uncomment this is you want to run RSpec tests
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec