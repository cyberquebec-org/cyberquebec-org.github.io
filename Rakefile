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
end
