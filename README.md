# CyberQuebec.org [WIP]
Pour des raisons de sécurité et de performances, le site internet de CyberQuebec.org utilise [Jekyll], un générateur de sites statiques.

# Comment développer le site localement
## Installer [Jekyll] et [Bundler]
Pour commencer, vous allez devoir installer [Ruby]. Pour ce faire, allez voir [la documentation](https://www.ruby-lang.org/fr/documentation/installation) qui donne des instruction d'installation pour Linux (Debian, Ubuntu, CentOS, Fedora, RHEL, Gentoo et Arch Linux), MacOS, Windows, Solaris et OpenIndiana.  

[Jekyll] et [Bundler] peuvent être installés avec la commande `gem install jekyll bundler` à exécuter dans un terminal. **Attention, vous aurez probablement besoin des droits d'administrateurs pour exécuter cette commande.**  

## Cloner le projet avec Git
Si vous n'avez pas déjà Git d'installé, vous pouvez l'obtenir pour Linux/Unix, MacOS et Windows [ici](https://git-scm.com/downloads). Une fois installé, [configurez votre nom et votre courriel](https://git-scm.com/book/fr/v2/D%C3%A9marrage-rapide-Param%C3%A9trage-%C3%A0-la-premi%C3%A8re-utilisation-de-Git) avant de continuer.  

Ensuite, vous pouvez cloner le projet à l'aide de la commande `git clone https://github.com/cyberquebec-org/cyberquebec-org.github.io`. Cela créera un nouveau dossier du nom de `cyberquebec-org.github.io` avec tout le code source du site dans le répertoire où vous avez exécuté la commande.

## Installer les dépendances
Grâce à [Bundler], toutes les dépendances du projet peuvent être installées en exécutant `bundle install`.  

## Ouvrir un serveur pour faire du développement
Lorsque vous développez le site, vous pouvez exécuter un serveur avec la commande `bundle exec jekyll serve -wol`.  
Par défaut, il ouvrira le port `4000` à l'adresse `127.0.0.1:4000` que vous pouvez entrer dans un navigateur Web pour voir le site.  
L'argument `-wol` fait en sorte que [Jekyll]: 
* Ouvre automatiquement votre navigateur par défaut
* Regénère automatiquement les pages modifiées lorsque vous enregistrez des fichiers (peut importe l'éditeur)
* Rafraîchie les pages ouvertes dans votre navigateur lorsque des pages sont regénérées

## Générer le site pour la production
Vous pourriez exécuter le serveur et copier le répertoire `_site`, mais générer le site en mode production nous donne certains avantage dont l'exécution de [jekyll-minifier] pour réduire la taille des fichiers. La commande `JEKYLL_ENV=production bundle exec jekyll build` permet de faire cela. Le site généré sera dans le dossier `_site`.

# License
Pour l'instant, ce projet n'a pas de license, mais il reste tout de même la propriété de CyberQuebec.org. Le dossier `assets/images` n'a pas été inclut dans le code source distribué pour des raisons de droits d'auteur.

# Dépendances
Cette section est une liste non-exhaustive des projets qui sont et pourraient être utilisés pour créer ce site.

## Générateur de sites statiques
[Jekyll] est le générateur de sites statiques utilisé à l'heure actuelle pour faire le site du CCTT. Il a l'avantage d'être déjà supporté nativement par GitHub pages, d'être le plus populaire et d'avoir un système de plugin avec une communauté qui l'entoure.

[Middleman](https://middlemanapp.com/) est cependant aussi considéré à l'heure actuelle, car il possède également un système de plugin (moins développé que [Jekyll]), il est beaucoup plus flexible, on peut l'étendre avec du Ruby, il supporte l'internationalisation sans utiliser de plugin et il supporte [les tests Cucumber](https://cucumber.io/) qui pourraient être utilisés pour valider les [JSON Schema](https://json-schema.org/) et s'assurer que les traductions de toutes les pages sont faites. Il est cependant à noter qu'il n'est pas officiellement supporté par GitHub Pages et que sa flexibilité le rend plus difficile d'utilisation pour les gens ne connaissant pas le Ruby.
## Style
Pour donner du style au site, [Bootstrap] est utilisé. C'est un outils open source qui peut être utilisé pour donner du style aux sites internets utilisant du [HTML], du [CSS] et du [JS]. Elle est elle-même faite en [JS] et en [SASS] et les librairies javascript [JQuery (slim build)](https://jquery.com/) et [Popper.js](https://popper.js.org/).  

[Bootstrap] a d'abord été choisi, car c'est la librairie la plus populaire de ce genre et qu'elle est compatible avec tous les navigateurs web.  
Elle possède un système de grille et pleins de classes qui nous permettent de facilement designer notre site pour qu'il soit compatible avec les écrans de toutes les tailles.  
Le fait qu'elle utilise le SASS plutôt que le CSS est aussi un énorme avantage, puisqu'on peut modifier les valeurs des variables afin de changer les couleurs du thème de base pour celles du CCTT.  

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
Pour le formattage du code par [kramdown], [Rouge](http://rouge.jneen.net/) (écrite en [Ruby]) est la librairie utilisée. Les classes utilisées pour le HTML du code sont les mêmes que celles utilisées par un autre formatteur de code du nom de [Pygments](http://pygments.org/) (écrit en [Ruby]). Grâce à cela, nous pouvons utiliser n'importe quel stylesheet destinée à [Pygments]. Celui utilisé à l'heure actuelle est `monokai` (le thème utilisé dans [Sublime Text](https://www.sublimetext.com/)), qui fut prit de [ce site](http://jwarby.github.io/jekyll-pygments-themes/languages/javascript.html) où nous pouvons choisir un autre thème.  

[CommonMark] est un standard de Markdown que nous pourrions utilisé grâce à [un plugin pour Jekyll](https://github.com/jekyll/jekyll-commonmark). Ce plugin fait partie des projets des développeurs de [Jekyll] et est plus performant que [kramdown], car [CommonMark] est implémenté en [C](https://www.iso.org/standard/74528.html) alors que [kramdown] est fait en [Ruby]. Par contre, nous perdrions la fonctionnalité de pouvoir ajouter des `classes` et des `id` aux éléments HTML.

## Optimisation de moteurs de recherche (SEO)
L'optimisation de moteurs de recherche et un groupe de techniques utilisées pour mieux informer le moteur de recherche sur le contenu de notre site et de ses pages.

[Jekyll SEO](https://github.com/jekyll/jekyll-seo-tag) est un plugin pour [Jekyll]

[polyglot] donne également de [bons conseils sur le SEO](https://polyglot.untra.io/en/seo/), mais ses conseils sont par rapport aux sites multilingues.

## Minifier
Un minifier est un programme qui va retirer tous les caractères qui ne sont pas nécessaires des fichiers HTML, CSS, JS et autres afin qu'ils prennent moins de place et soient envoyés plus vite et que les pages chargent plus rapidement.  
Le minifier utilisé est un plugin de [Jekyll] du nom de [jekyll-minifier](https://github.com/digitalsparky/jekyll-minifier), mais il n'est exécuté qu'en mode production. Ceci est une bonne chose, car ça nous permet de pouvoir lire le code source plus facilement et d'avoir accès aux commentaires dans le navigateur pour faire du déboggage lors du développement.  

## Recherche de contenu sur le site
[lunr.js](https://learn.cloudcannon.com/jekyll/jekyll-search-using-lunr-js/) est une librairies en javascript que nous pourrions utiliser avec [Jekyll] pour que les utilisateurs puissent chercher dans le contenu de la trousse de cybersécurité ou dans les articles.

[Jekyll]: https://jekyllrb.com
[Bundler]: https://bundler.io/
[Ruby]: https://www.ruby-lang.org/en/
[Python]: https://python.org
[polyglot]: https://github.com/untra/polyglot
[kramdown]: https://kramdown.gettalong.org/
[CommonMark]: https://commonmark.org/
[Pygments]: http://pygments.org/
[Bootstrap]: https://getbootstrap.com
[HTML]: https://www.w3.org/html/
[CSS]: https://www.w3.org/Style/CSS/
[SASS]: https://sass-lang.com/
[JS]: https://www.ecma-international.org/publications/standards/Ecma-262.htm
