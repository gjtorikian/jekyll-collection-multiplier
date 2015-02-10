Gem::Specification.new do |s|
  s.name        = "jekyll-collection-multiplier"
  s.summary     = "Allows you to rerender a single Jekyll collection into multiple places"
  s.version     = "0.1.0"
  s.authors     = ["Garen J. Torikian"]

  s.homepage    = "https://github.com/gjtorikian/jekyll-collection-multiplier"
  s.licenses    = ["MIT"]
  s.files       = [ "lib/jekyll-collection-multiplier.rb" ]

  s.add_dependency "jekyll", '~> 2.0'

  s.add_development_dependency  'rake'
end
