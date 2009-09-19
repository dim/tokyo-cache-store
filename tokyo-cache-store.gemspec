# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tokyo-cache-store}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dimitrij Denissenko"]
  s.date = %q{2009-09-19}
  s.description = %q{Tokyo Tyrant cache store for ActiveSupport/Rails.}
  s.email = %q{contact@dvisionfactory.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "MIT-LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "init.rb",
     "lib/active_support/cache/tokyo_store.rb",
     "spec/tokyo_cache_store_spec.rb"
  ]
  s.homepage = %q{http://github.com/dim/tokyo-cache-store}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Tokyo Tyrant Cache Store}
  s.test_files = [
    "spec/tokyo_cache_store_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.0"])
      s.add_runtime_dependency(%q<actsasflinn-ruby-tokyotyrant>, [">= 0.2.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.0"])
      s.add_dependency(%q<actsasflinn-ruby-tokyotyrant>, [">= 0.2.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.0"])
    s.add_dependency(%q<actsasflinn-ruby-tokyotyrant>, [">= 0.2.0"])
  end
end
