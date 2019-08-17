# Caractère signifiant que le string est une variable
CARACTERE_SPECIAL = ':'

# Caractère utilisé pour séparer variables pour atteindre le titre
CARACTERE_SEPARATEUR = '.'

# Clé de la page pour obtenir le titre
CLE_TITRE = 'title'
CLE_LANG = 'lang'

# TODO utiliser la méthode Hash::Dig si possible: https://tiagoamaro.com.br/2016/08/27/ruby-2-3-dig/

Jekyll::Hooks.register :site, :pre_render do |site|
    erreur = lambda do |segments, segment, page|
        puts "'#{segments}' ne contient pas '#{segment}' pour le titre de la page '#{page.url}'"
    end

    # Pour chaque page du site
    site.pages.each do |page|
        title = page[CLE_TITRE]
        lang = page[CLE_LANG]

        # Sauter la page si ce n'est pas un String qui commence par le caractère spécial
        next if title == nil ||
            !title.is_a?(String) ||
            !title.start_with?(CARACTERE_SPECIAL)

        # Sauter le caractère spécial
        title = title[CARACTERE_SPECIAL.size..]

        resultat = site.data[lang]
        segments = 'site.data.' + lang

        # Pour chaque segment du titre séparé par un point
        title.split(CARACTERE_SEPARATEUR).each do |segment|
            if resultat.respond_to?(:[])
                resultat = resultat[segment]
                if resultat.nil?
                    erreur.call(segments, segment, page)
                    next
                end
                segments += "#{CARACTERE_SEPARATEUR}#{segment}"
            else
                erreur.call(segments, segment, page)
                next
            end
        end

        # Assigner le résultat au titre de la page.
        page.data[CLE_TITRE] = resultat
    end
end
