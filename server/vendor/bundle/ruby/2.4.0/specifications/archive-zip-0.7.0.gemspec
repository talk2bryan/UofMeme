# -*- encoding: utf-8 -*-
# stub: archive-zip 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "archive-zip".freeze
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeremy Bopp".freeze]
  s.date = "2014-08-19"
  s.description = "Archive::Zip provides a simple Ruby-esque interface to creating, extracting, and\nupdating ZIP archives.  This implementation is 100% Ruby and loosely modeled on\nthe archive creation and extraction capabilities of InfoZip's zip and unzip\ntools.\n".freeze
  s.email = ["jeremy@bopp.net".freeze]
  s.homepage = "http://github.com/javanthropus/archive-zip".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "archive-zip".freeze
  s.rubygems_version = "2.7.4".freeze
  s.summary = "Simple, extensible, pure Ruby ZIP archive support.".freeze

  s.installed_by_version = "2.7.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<io-like>.freeze, ["~> 0.3.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.4"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<yard-redcarpet-ext>.freeze, ["~> 0.0"])
      s.add_development_dependency(%q<github-markup>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<redcarpet>.freeze, ["~> 3.1"])
    else
      s.add_dependency(%q<io-like>.freeze, ["~> 0.3.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.4"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_dependency(%q<yard-redcarpet-ext>.freeze, ["~> 0.0"])
      s.add_dependency(%q<github-markup>.freeze, ["~> 1.2"])
      s.add_dependency(%q<redcarpet>.freeze, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<io-like>.freeze, ["~> 0.3.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.4"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<yard-redcarpet-ext>.freeze, ["~> 0.0"])
    s.add_dependency(%q<github-markup>.freeze, ["~> 1.2"])
    s.add_dependency(%q<redcarpet>.freeze, ["~> 3.1"])
  end
end
