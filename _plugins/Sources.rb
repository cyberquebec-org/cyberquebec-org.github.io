# frozen_string_literal: true

module Jekyll
  module SourcesFilter
    CHIFFRES = '0123456789'
    ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

    PROP_TITRE = 'title'
    def sources_alphabetiques(sources)
      sources.sort_by! do |source|
        source[PROP_TITRE]
      end
      groupes = sources.group_by do |source|
        char = Utils.slugify(source[PROP_TITRE][0], mode: 'latin')
        if ALPHABET.include?(char)
        then char
        elsif CHIFFRES.include?(char)
        then '0-9'
        else '!$%&'
        end
      end
      groupes.sort
    end
  end
end

Liquid::Template.register_filter(Jekyll::SourcesFilter)
