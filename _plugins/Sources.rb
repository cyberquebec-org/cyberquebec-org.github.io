module Jekyll
    module SourcesFilter
        CHIFFRES = '0123456789'
        ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

        PROP_NOM = 'nom'
        def sources_alphabetiques(sources)
            sources.sort_by { |source| source[PROP_NOM] }.group_by { |source|
                char = Utils::slugify(source[PROP_NOM][0], mode: "latin")
                resultat = '!$%&'
                resultat = char if ALPHABET.include?(char)
                resultat = '0-9' if CHIFFRES.include?(char)
                resultat
            }
        end
    end
end

Liquid::Template.register_filter(Jekyll::SourcesFilter)
