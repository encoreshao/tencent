# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tencent/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Enocre Shao"]
  gem.email         = ["encore.shao@gmail.com"]
  gem.description   = %q{A wrapper for tencent OAuth2 API}
  gem.summary       = %q{A Simple wrapper for tencent OAuth2 API}
  gem.homepage      = "https://github.com/fmmp3/tencent"

  gem.files         = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tencent"
  gem.require_paths = ["lib"]
  gem.version       = Tencent::VERSION
  
  gem.add_dependency "oauth2", "~> 0.5.1"
  gem.add_development_dependency "thoughtbot-shoulda", "~> 2.11.1"
  gem.add_development_dependency('rspec-rails')
end
