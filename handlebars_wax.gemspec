$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "handlebars_wax/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "handlebars_wax"
  s.version     = HandlebarsWax::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HandlebarsWax."
  s.description = "TODO: Description of HandlebarsWax."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.4"
  s.add_dependency "hbs"
  
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "sqlite3"
end
