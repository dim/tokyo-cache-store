require 'rake'
require 'spec/rake/spectask'

task :default => :spec

desc "Run the extension specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList["spec/**/*_spec.rb"]
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |spec|
    spec.name = "tokyo-cache-store"
    spec.summary = "Tokyo Tyrant Cache Store"
    spec.email = "contact@dvisionfactory.com"
    spec.homepage = "http://github.com/dim/tokyo-cache-store"
    spec.description = "Tokyo Tyrant cache store for ActiveSupport/Rails."
    spec.authors = ["Dimitrij Denissenko"]
    spec.test_files = Dir.glob('spec/**')
    spec.add_dependency('activesupport', '>= 2.3.0')
    spec.add_dependency('actsasflinn-ruby-tokyotyrant', '>= 0.2.0')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

