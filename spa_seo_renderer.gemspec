# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spa_seo_renderer/version'

Gem::Specification.new do |spec|
  spec.name = "spa_seo_renderer"
  spec.version = SpaSeoRenderer::VERSION
  spec.authors = ["Daniel Williams"]
  spec.email = ["enknamel@gmail.com"]

  spec.summary = %q{Perfect for Single Page Application SEO}
  spec.description = %q{This gem will intercept request from webcrawlers and then re-request pages using a headless driver to deliver a fully rendered page to webcrawlers}
  spec.homepage = "https://github.com/enknamel/spa_seo_renderer"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'capybara-webkit', '~> 1.6.0'
end
