desc_live_server = "Exécute le serveur de développement (défaut)"

desc desc_live_server
task :default => :live_server

desc desc_live_server
task :live_server do
    sh 'bundle exec jekyll serve -wol'
end

desc "Génère le site en mode de développement"
task :dev_build do
    sh 'bundle exec jekyll build'
end

desc "Génère le site en mode de production dans le dossier public"
task :production_build do
    ENV['JEKYLL_ENV'] = 'production'
    sh 'bundle exec jekyll build -d public'
end

desc "Tous les tests du site"
namespace :tests do
    desc "Test tous les liens avec jekyll-link-checker en mode verbose"
    task :liens do
        sh "bundle exec jekyll-link-checker -iV"
    end

    desc "Test tous les liens avec jekyll-link-checker en mode verbose" \
         "dans le dossier public"
    task :liens_public do
        sh "bundle exec jekyll-link-checker -iV -d public"
    end

    desc "Test la configuration du site"
    task :config do
        sh "bundle exec jekyll doctor"
    end
end

desc "Exécute tous les tests"
task :tests => ["tests:config", "tests:schemas", "tests:liens"]
