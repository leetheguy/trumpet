$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "trumpet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trumpet"
  s.version     = Trumpet::VERSION
  s.authors     = ["Lee Nathan", "Michael Q Larson"]
  s.email       = ["leetheguy@gmail.com"]
  s.homepage    = "https://github.com/leetheguy/trumpet"
  s.summary     = "Simple, flexible gamification for Rails."
  s.description = "Simple, flexible gamification for Rails."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "sqlite3"
end
