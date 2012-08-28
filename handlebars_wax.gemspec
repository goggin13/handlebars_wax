$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "handlebars_wax/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "handlebars_wax"
  s.version     = HandlebarsWax::VERSION
  s.authors     = ["Becky Carella", "Matt Goggin"]
  s.email       = ["becarella@gmail.com", "goggin13@gmail.com"]
  s.homepage    = "https://github.com/goggin13/handlebars_wax"
  s.summary     = "a wrapper for the handlebars_assets and handlebars.rb gems"
  s.description = <<-EOF
    A gem to simplify use of Handlebars templates both server side and client side.

    Features:
    * Sprockets compilation of handlebars templates
    * Register templates as partials for use in Javascript
    * Server side rendering
  EOF

  s.files = Dir["{app,config,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "readme.markdown"]

  s.add_dependency "rails", "~> 3.1.4"
  s.add_dependency "handlebars"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "selenium-webdriver", "~> 2.25.0"
end
