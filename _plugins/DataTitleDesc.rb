# Caractère signifiant que le string est une variable
CARACTERE_SPECIAL = ':'

# Caractère utilisé pour séparer variables pour atteindre le titre
CARACTERE_SEPARATEUR = '.'

# Clé des propriétés du front matter à remplacer
CLE_REMPLACER = ['title', 'description']
CLE_LANG = 'lang'

Jekyll::Hooks.register :site, :pre_render do |site|
    erreur = lambda do |segments, segment, page|
        puts "'#{segments}' ne contient pas '#{segment}' pour le titre de la page '#{page.url}'"
    end

    # Pour chaque page du site
    site.pages.each do |page|
        lang = page[CLE_LANG]

        CLE_REMPLACER.each do |cle|
            valeur = page.data[cle]

            # Sauter si la valeur ne commence pas par le caractère spécial
            next if valeur == nil ||
                !valeur.is_a?(String) ||
                !valeur.start_with?(CARACTERE_SPECIAL)

            # Sauter le caractère spécial
            valeur = valeur[CARACTERE_SPECIAL.size..]

            elements = valeur.split(CARACTERE_SEPARATEUR)
            resultat = site.data[lang].dig(*elements) ||
                       site.data.dig(*elements)

            if resultat
                page.data[cle] = resultat
            else
                Jekyll.logger.error "La propriété `#{valeur}` n'a pas été trouvée dans `site.data` ou dans `site.data.#{lang}` pour l'élément `#{cle}` de la page `#{page.url}`"
            end
        end
    end
end
