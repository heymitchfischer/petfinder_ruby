Gem::Specification.new do |s|
  s.name = "petfinder_ruby"
  s.version = "0.1.0"
  s.summary = "Test Gem that assists with interacting with the Petfinder REST API. For a more robust gem, see https://github.com/ehutzelman/petfinder"
  s.authors     = ["Mitch Fischer"]
  s.files = ["lib/petfinder_ruby.rb"]
  s.require_paths = ["lib"]
  s.add_dependency "unirest", "~> 1.1"
end