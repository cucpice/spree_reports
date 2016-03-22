$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spree_reports/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spree_reports"
  s.version     = SpreeReports::VERSION
  s.authors     = ["Mike Lieser"]
  s.email       = ["mikelieser@me.com"]
  s.homepage    = "https://github.com/formrausch/spree_reports"
  s.summary     = "A couple of interesting reports for Spree shops."
  s.description = "Awesome Spree Reports: orders by period, orders by payment type, orders by value range"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'solidus_core'
  s.add_runtime_dependency 'groupdate', '~> 2.4'
  s.add_runtime_dependency 'chartkick', '~> 1.3'
end
