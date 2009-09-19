require 'rake'
require 'spec/rake/spectask'

desc 'Default: run unit tests.'
task :default => :spec

desc "Run the extension specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList["spec/**/*_spec.rb"]
end
