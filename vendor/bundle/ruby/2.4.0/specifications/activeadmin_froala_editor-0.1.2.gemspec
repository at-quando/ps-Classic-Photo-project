# -*- encoding: utf-8 -*-
# stub: activeadmin_froala_editor 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "activeadmin_froala_editor".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mattia Roccoberton".freeze]
  s.date = "2017-10-23"
  s.description = "An Active Admin plugin to use Froala WYSIWYG editor".freeze
  s.email = "mat@blocknot.es".freeze
  s.homepage = "https://github.com/blocknotes/activeadmin_froala_editor".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Froala editor for ActiveAdmin".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activeadmin>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<activeadmin>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<activeadmin>.freeze, ["~> 1.0"])
  end
end
