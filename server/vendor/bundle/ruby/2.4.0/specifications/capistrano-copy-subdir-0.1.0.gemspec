# -*- encoding: utf-8 -*-
# stub: capistrano-copy-subdir 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-copy-subdir".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yamashita Yuu".freeze]
  s.date = "2013-03-15"
  s.description = "a capistrano strategy to deploy subdir with copy strategy.".freeze
  s.email = ["yamashita@geishatokyo.com".freeze]
  s.homepage = "https://github.com/yyuu/capistrano-copy-subdir".freeze
  s.rubygems_version = "2.7.4".freeze
  s.summary = "a capistrano strategy to deploy subdir with copy strategy.".freeze

  s.installed_by_version = "2.7.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, [">= 0"])
      s.add_development_dependency(%q<net-scp>.freeze, ["~> 1.0.4"])
      s.add_development_dependency(%q<net-ssh>.freeze, ["~> 2.2.2"])
      s.add_development_dependency(%q<vagrant>.freeze, ["~> 1.0.6"])
    else
      s.add_dependency(%q<capistrano>.freeze, [">= 0"])
      s.add_dependency(%q<net-scp>.freeze, ["~> 1.0.4"])
      s.add_dependency(%q<net-ssh>.freeze, ["~> 2.2.2"])
      s.add_dependency(%q<vagrant>.freeze, ["~> 1.0.6"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, [">= 0"])
    s.add_dependency(%q<net-scp>.freeze, ["~> 1.0.4"])
    s.add_dependency(%q<net-ssh>.freeze, ["~> 2.2.2"])
    s.add_dependency(%q<vagrant>.freeze, ["~> 1.0.6"])
  end
end
