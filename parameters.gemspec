# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{parameters}
  s.version = "0.1.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-02-11}
  s.description = %q{Parameters allows you to add annotated variables to your classes which may have configurable default values.}
  s.email = %q{postmodern.mod3@gmail.com}
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".specopts",
    ".yardopts",
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "lib/parameters.rb",
    "lib/parameters/class_methods.rb",
    "lib/parameters/class_param.rb",
    "lib/parameters/exceptions.rb",
    "lib/parameters/exceptions/missing_param.rb",
    "lib/parameters/exceptions/param_not_found.rb",
    "lib/parameters/extensions.rb",
    "lib/parameters/extensions/meta.rb",
    "lib/parameters/extensions/meta/object.rb",
    "lib/parameters/instance_param.rb",
    "lib/parameters/param.rb",
    "lib/parameters/parameters.rb",
    "lib/parameters/parser.rb",
    "lib/parameters/version.rb",
    "lib/parameters/yard.rb",
    "lib/parameters/yard/handlers.rb",
    "lib/parameters/yard/handlers/ruby.rb",
    "lib/parameters/yard/handlers/ruby/legacy.rb",
    "lib/parameters/yard/handlers/ruby/legacy/parameter_handler.rb",
    "lib/parameters/yard/handlers/ruby/parameter_handler.rb",
    "spec/classes/custom_parameters.rb",
    "spec/classes/inherited_parameters.rb",
    "spec/classes/other_parameters.rb",
    "spec/classes/test_parameters.rb",
    "spec/parameters_spec.rb",
    "spec/parser_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/postmodern/parameters}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Allows you to add annotated variables to your classes}
  s.test_files = [
    "spec/parameters_spec.rb",
    "spec/spec_helper.rb",
    "spec/parser_spec.rb",
    "spec/classes/inherited_parameters.rb",
    "spec/classes/test_parameters.rb",
    "spec/classes/custom_parameters.rb",
    "spec/classes/other_parameters.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_development_dependency(%q<yard>, [">= 0.4.0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_dependency(%q<yard>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
    s.add_dependency(%q<yard>, [">= 0.4.0"])
  end
end

