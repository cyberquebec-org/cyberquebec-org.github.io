source "https://rubygems.org"

gem 'rake'

group :jekyll_plugins do
    gem 'jekyll-minifier'
    gem 'jekyll-sitemap'
    gem 'jekyll-polyglot', :git => 'https://github.com/ZakCodes/polyglot.git'
end

# Règle le problème d'affichage de l'icône dans la barre d'outils en attendant
# que https://github.com/digitalsparky/cssminify/pull/3 soit merged
gem "cssminify2", :git => 'https://github.com/bbbenji/cssminify'

group :test do
    gem 'jekyll-link-checker', :git => 'https://gitlab.com/ZakCodes/jekyll-link-checker.git'

    gem 'front_matter_parser'
    gem 'json_schemer'
    gem 'safe_yaml'
end
