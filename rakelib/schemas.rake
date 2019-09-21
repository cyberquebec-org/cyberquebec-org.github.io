# frozen_string_literal: true

require 'json_schemer'
require 'front_matter_parser'
require 'yaml'
require 'pp'
require 'date'
require 'time'

namespace :tests do
  EXTENSIONS_YAML = ['.yml', '.yaml'].freeze

  task :schemas do
    config = EXTENSIONS_YAML.map do |ext|
      fichier = "_config#{ext}"
      begin
        YAML.load_file(fichier)
      rescue StandardError
        nil
      end
    end.find(&:itself) # Utiliser find_map lorsque cette méthode existera
    raise "Le fichier de configuration n'a pas pu être chargé" unless config

    collections_dir = config['collections_dir'] || ''
    collections = config['collections'] || {}

    schema_checker_cfg = config['schema-checker'] || {}
    verbose = schema_checker_cfg['verbose']
    abort_on_failure = schema_checker_cfg['abort']
    abort_on_failure = true if abort_on_failure.nil?

    skip = schema_checker_cfg['skip'] || []

    collections['posts'] = {} unless collections.include?('posts')

    # Nb d'erreurs de validation
    err_validation = 0
    # Nb d'erreurs de lecture de fichiers
    err_lecture = 0

    collections.each do |collection, options|
      check_schemas = options['check_schemas'] || true
      next unless check_schemas

      dir = File.join("_#{collection}", '*')
      puts "Collection #{dir}"

      fichiers = Dir[dir]
      schema = fichiers.find do |fichier|
        File.basename(fichier, '.*') == 'schema' &&
          EXTENSIONS_YAML.include?(File.extname(fichier))
      end
      unless schema
        # Incrémenter le nombre d'erreur de lecture
        err_lecture += 1

        # TODO: Retourner une erreur disant que le schéma n'a pas été trouvé.
        puts "Le schéma de la collection \"#{collection}\" n'a pas été trouvé"
        next
      end

      schema = YAML.load_file(schema)
      schemer = JSONSchemer.schema(schema)

      # Nb erreur de validation pour la collection
      err_validation_collection = 0
      # Nb erreur de lecture pour la collection
      err_lecture_collection = 0

      fichiers.filter do |fichier|
        skip.none? { |pattern| File.fnmatch(pattern, fichier) }
      end.each do |fichier|
        begin
          parsed = FrontMatterParser::Parser.parse_file(fichier)

          next if parsed.front_matter['skip-schema-check']

          parsed.front_matter['content'] = parsed.content
          erreurs = schemer.validate(parsed.front_matter).entries
          if !erreurs.empty?
            # Incrémenter le nombre d'erreurs de validation
            err_validation_collection += erreurs.size

            # Afficher le nom du fichier avec un symbol d'erreurs
            puts "#{fichier} \xE2\x9D\x97"

            # Afficher les détails des erreurs
            puts(erreurs.map { |erreur| erreur['details'] || erreur.to_yaml })
            puts "size: #{erreurs.size}"
          elsif verbose
            # Afficher le nom du fichier avec un symbol de réussite
            puts "#{fichier} \xE2\x9C\x94"
          end
        rescue NameError
        rescue StandardError => e
          # Incrémenter le nombre d'erreurs de lecture
          err_lecture_collection += 1

          puts "#{fichier} \xE2\x9D\x93"
          pp e
        end
      end

      # S'il y eu une erreur de lecture ou de validation
      next if (err_validation_collection + err_lecture_collection) == 0

      puts "Erreurs de validation: #{err_validation_collection}, erreurs de lecture: #{err_lecture_collection}"

      err_validation += err_validation_collection
      err_lecture += err_lecture_collection
    end

    err_total = err_validation + err_lecture
    if err_total > 0
      msg = "Erreurs totales: #{err_total}, erreurs de validation: #{err_validation}, erreurs de lecture: #{err_lecture}"
      if abort_on_failure
      then abort msg
      else puts msg
      end
    else
      puts 'Aucune erreur'
    end
  end
end
