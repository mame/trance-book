# -*- encoding: utf-8 -*-
# stub: psych 2.0.14 ruby lib
# stub: ext/psych/extconf.rb

Gem::Specification.new do |s|
  s.name = "psych"
  s.version = "2.0.14"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aaron Patterson"]
  s.date = "2015-08-21"
  s.description = "Psych is a YAML parser and emitter.  Psych leverages libyaml[http://pyyaml.org/wiki/LibYAML]\nfor its YAML parsing and emitting capabilities.  In addition to wrapping\nlibyaml, Psych also knows how to serialize and de-serialize most Ruby objects\nto and from the YAML format."
  s.email = ["aaron@tenderlovemaking.com"]
  s.extensions = ["ext/psych/extconf.rb"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "README.rdoc", "ext/psych/extconf.rb", "test/psych/handlers/test_recorder.rb", "test/psych/json/test_stream.rb", "test/psych/nodes/test_enumerable.rb", "test/psych/test_alias_and_anchor.rb", "test/psych/test_array.rb", "test/psych/test_boolean.rb", "test/psych/test_class.rb", "test/psych/test_coder.rb", "test/psych/test_date_time.rb", "test/psych/test_deprecated.rb", "test/psych/test_document.rb", "test/psych/test_emitter.rb", "test/psych/test_encoding.rb", "test/psych/test_exception.rb", "test/psych/test_hash.rb", "test/psych/test_json_tree.rb", "test/psych/test_marshalable.rb", "test/psych/test_merge_keys.rb", "test/psych/test_nil.rb", "test/psych/test_null.rb", "test/psych/test_numeric.rb", "test/psych/test_object.rb", "test/psych/test_object_references.rb", "test/psych/test_omap.rb", "test/psych/test_parser.rb", "test/psych/test_psych.rb", "test/psych/test_safe_load.rb", "test/psych/test_scalar.rb", "test/psych/test_scalar_scanner.rb", "test/psych/test_serialize_subclasses.rb", "test/psych/test_set.rb", "test/psych/test_stream.rb", "test/psych/test_string.rb", "test/psych/test_struct.rb", "test/psych/test_symbol.rb", "test/psych/test_tainted.rb", "test/psych/test_to_yaml_properties.rb", "test/psych/test_tree_builder.rb", "test/psych/test_yaml.rb", "test/psych/test_yamldbm.rb", "test/psych/test_yamlstore.rb", "test/psych/visitors/test_depth_first.rb", "test/psych/visitors/test_emitter.rb", "test/psych/visitors/test_to_ruby.rb", "test/psych/visitors/test_yaml_tree.rb"]
  s.homepage = "http://github.com/tenderlove/psych"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "2.5.0"
  s.summary = "Psych is a YAML parser and emitter"
  s.test_files = ["test/psych/handlers/test_recorder.rb", "test/psych/json/test_stream.rb", "test/psych/nodes/test_enumerable.rb", "test/psych/test_alias_and_anchor.rb", "test/psych/test_array.rb", "test/psych/test_boolean.rb", "test/psych/test_class.rb", "test/psych/test_coder.rb", "test/psych/test_date_time.rb", "test/psych/test_deprecated.rb", "test/psych/test_document.rb", "test/psych/test_emitter.rb", "test/psych/test_encoding.rb", "test/psych/test_exception.rb", "test/psych/test_hash.rb", "test/psych/test_json_tree.rb", "test/psych/test_marshalable.rb", "test/psych/test_merge_keys.rb", "test/psych/test_nil.rb", "test/psych/test_null.rb", "test/psych/test_numeric.rb", "test/psych/test_object.rb", "test/psych/test_object_references.rb", "test/psych/test_omap.rb", "test/psych/test_parser.rb", "test/psych/test_psych.rb", "test/psych/test_safe_load.rb", "test/psych/test_scalar.rb", "test/psych/test_scalar_scanner.rb", "test/psych/test_serialize_subclasses.rb", "test/psych/test_set.rb", "test/psych/test_stream.rb", "test/psych/test_string.rb", "test/psych/test_struct.rb", "test/psych/test_symbol.rb", "test/psych/test_tainted.rb", "test/psych/test_to_yaml_properties.rb", "test/psych/test_tree_builder.rb", "test/psych/test_yaml.rb", "test/psych/test_yamldbm.rb", "test/psych/test_yamlstore.rb", "test/psych/visitors/test_depth_first.rb", "test/psych/visitors/test_emitter.rb", "test/psych/visitors/test_to_ruby.rb", "test/psych/visitors/test_yaml_tree.rb"]
end
