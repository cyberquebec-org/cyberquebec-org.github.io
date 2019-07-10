# CyberQuebec.org [WIP]
Pour des raisons de sécurité et de performances, le site internet de CyberQuebec.org utilise [Jekyll], un générateur de sites statiques.

# License
Pour l'instant, ce projet n'a pas de license, mais il reste tout de même la propriété de CyberQuebec.org. Le dossier `assets/images` n'a pas été inclut dans le code source distribué pour des raisons de droits d'auteur.

# Dépendances
Cette section est une liste non-exhaustive des projets qui sont et pourraient être utilisés pour créer ce site.

## Générateur de sites statiques
[Jekyll] est le générateur de sites statiques utilisé à l'heure actuelle pour faire le site du CCTT. Il a l'avantage d'être déjà supporté nativement par GitHub pages, d'être le plus populaire et d'avoir un système de plugin avec une communauté qui l'entoure.

[Middleman](https://middlemanapp.com/) est cependant aussi considéré à l'heure actuelle, car il possède également un système de plugin (moins développé que [Jekyll]), il est beaucoup plus flexible, on peut l'étendre avec du Ruby, il supporte l'internationalisation sans utiliser de plugin et il supporte [les tests Cucumber](https://cucumber.io/) qui pourraient être utilisés pour valider les [JSON Schema](https://json-schema.org/) et s'assurer que les traductions de toutes les pages sont faites. Il est cependant à noter qu'il n'est pas officiellement supporté par GitHub Pages et que sa flexibilité le rend plus difficile d'utilisation pour les gens ne connaissant pas le Ruby.

## I18n
Le plugin qui sera utilisé pour gérer l'internationalisation (la traduction des pages) n'est pas encore décidé. Voici les options qui sont considérées:
* [jekyll-multiple-languages-plugin](https://github.com/kurtsson/jekyll-multiple-languages-plugin)
    * 4 à 5x plus populaire que polyglot
    * Maintenue beaucoup plus activement
    * Permet de traduire les liens vers les pages
* [polyglot]
    * Il donne de bons conseils de [SEO pour les sites multilingues](https://polyglot.untra.io/en/seo/) (**nous pouvons utiliser ces conseils même sans polyglot**)

## Génerateur de HTML pour Markdown
[kramdown] est celui par défaut pour [Jekyll] ainsi que celui qui est utilisé en ce moment. En plus des fonctionnalités du standard Markdown, [kramdown] nous permet de [d'ajouter des classes et des IDs aux éléments](https://kramdown.gettalong.org/syntax.html#attribute-list-definitions), ce qui pourrait nous être très utile.  
Cependant, [kramdown] ne respecte pas totalement le standard Markdown, mais pour l'utilisation que nous allons en faire, nous ne devrions pas être affectés.

[CommonMark] est un standard de Markdown que nous pourrions utilisé grâce à [un plugin pour Jekyll](https://github.com/jekyll/jekyll-commonmark). Ce plugin fait partie des projets des développeurs de [Jekyll] et est plus performant que [kramdown], car [CommonMark] est implémenté en [C](https://www.iso.org/standard/74528.html) alors que [kramdown] est fait en [Ruby]. Par contre, nous perdrions la fonctionnalité de pouvoir ajouter des `classes` et des `id` aux éléments HTML.

## Optimisation de moteurs de recherche (SEO)
L'optimisation de moteurs de recherche et un groupe de techniques utilisées pour mieux informer le moteur de recherche sur le contenu de notre site et de ses pages.

[Jekyll SEO](https://github.com/jekyll/jekyll-seo-tag) est un plugin pour [Jekyll]

[polyglot] donne également de [bons conseils sur le SEO](https://polyglot.untra.io/en/seo/), mais ses conseils sont par rapport aux sites multilingues.

## Recherche de contenu sur le site
[lunr.js](https://learn.cloudcannon.com/jekyll/jekyll-search-using-lunr-js/) est une librairies en javascript que nous pourrions utiliser avec [Jekyll] pour que les utilisateurs puissent chercher dans le contenu de la trousse de cybersécurité ou dans les articles.

[Jekyll]: https://jekyllrb.com
[Ruby]: https://www.ruby-lang.org/en/
[polyglot]: https://github.com/untra/polyglot
[kramdown]: https://kramdown.gettalong.org/
[CommonMark]: https://commonmark.org/