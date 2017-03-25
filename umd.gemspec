# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'umd/version'

Gem::Specification.new do |spec|
  spec.name          = "umd"
  spec.version       = Umd::VERSION
  spec.authors       = ["J-P Teti"]
  spec.email         = ["jp@jpteti.com"]

  spec.summary       = %q{Ruby API wrapper for umd.io.}
  spec.description   = %q{A Ruby API wrapper for umd.io}
  spec.homepage      = "https://github.com/jpteti/umd"
  spec.license       = "Nonstandard"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.cert_chain  = ['certs/jpteti.pem']
  spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "httparty", "~> 0.14.0"
end
