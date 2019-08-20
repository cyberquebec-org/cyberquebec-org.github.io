module Jekyll
    module SourcesFilter
        CHIFFRES = '0123456789'
        ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

        PROP_TITRE = 'title'
        def sources_alphabetiques(sources)
            sources.sort_by { |source| source[PROP_TITRE] }.group_by { |source|
                char = Utils::slugify(source[PROP_TITRE][0], mode: "latin")
                resultat = '!$%&'
                resultat = char if ALPHABET.include?(char)
                resultat = '0-9' if CHIFFRES.include?(char)
                resultat
            }
        end
    end
end

Liquid::Template.register_filter(Jekyll::SourcesFilter)
