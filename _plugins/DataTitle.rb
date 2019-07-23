# Caractère signifiant que le string est une variable
CARACTERE_SPECIAL = ':'
# Clé de la page pour obtenir le titre
CLE_TITRE = 'title'

Jekyll::Hooks.register :site, :pre_render do |site|
    erreur = lambda do |segments, segment, page|
        puts "'#{segments}' ne contient pas '#{segment}' pour le titre de la page '#{page.url}'"
    end
    
    # Pour chaque page du site
    site.pages.each do |page|
        # Obtenir le titre 
        title = page[CLE_TITRE]

        # Sauter la page si ce n'est pas un String qui commence par le caractère spécial
        next if title == nil || !title.is_a?(String) || !title.start_with?(CARACTERE_SPECIAL)

        # Sauter le caractère spécial
        title = title[CARACTERE_SPECIAL.size..]

        resultat = site.data
        segments = 'site.data'

        # Pour chaque segment du titre séparé .
        title.split('.').each do |segment|
            if resultat.respond_to?(:[])
                resultat = resultat[segment]
                if resultat == nil 
                    erreur.call(segments, segment, page)
                    next
                end
                segments += ".#{segment}"
            else 
                erreur.call(segments, segment, page)
                next
            end
        end

        # Assigner le résultat au titre de la page.
        page.data[CLE_TITRE] = resultat
    end
end