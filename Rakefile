require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name = "hiera-classifier"
  s.version = "0.0.1"
  s.author = "Kelsey Hightower"
  s.email = "kelsey@puppetlabs.com"
  s.homepage = "https://github.com/kelseyhightower/hiera-classifier"
  s.platform = Gem::Platform::RUBY
  s.summary = "Puppet Classifier backend for Hiera"
  s.description = "Query Hiera data from Puppet Classifier"
  s.files = FileList["{lib}/**/*"].to_a
  s.require_path = "lib"
  s.add_dependency 'hiera'
  s.add_dependency 'sequel'
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

task :default => [:repackage]

