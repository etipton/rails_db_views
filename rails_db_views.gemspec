$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_db_views/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_db_views"
  s.version     = RailsDbViews::VERSION
  s.authors     = ["Yacine Petitprez"]
  s.email       = ["anykeyh@gmail.com"]
  s.homepage    = "https://github.com/anykeyh/rails_db_views"
  s.summary     = "Provide tools to create and manage database view through Rails project."
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]
  s.licenses = ["MIT"]

  s.add_dependency "rails", ">= 3.0"

  s.add_development_dependency "sqlite3"
end
