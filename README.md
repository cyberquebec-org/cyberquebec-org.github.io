# CyberQuebec.org [WIP]
[![Build Status](https://travis-ci.org/cyberquebec-org/cyberquebec-org.github.io.svg?branch=source)](https://travis-ci.org/cyberquebec-org/cyberquebec-org.github.io)

Pour des raisons de sécurité et de performances, le site Internet de CyberQuebec.org utilise [Jekyll], un générateur de sites statiques.

# Comment développer le site localement
Dans cette section, plusieurs commandes à exécuter dans un terminal sont présentées.  

Chaque commande sera précédée de `pwd$ ` où `pwd` spécifie l'endroit où la commande doit être exécuté. Si sa valeur est `*` (`*$`), vous pouvez exécuter la commande n'importe où. Si elle commence par `projets` (`projets$ `), cela signifie que la commande doit être exécuter dans le dossier qui contient ou va contenir ce projet sur votre ordinateur. Si elle commence par `site` (`site$ `), cela signifie que la commande doit être exécutée à la racine du dossier de projet (pas dans un sous-dossier du dossier de projet).  

Le résultat de chaque commande à exécuter sera aussi inscrit sur la ligne suivant la commande et ne débutera pas par `pwd$ `.

## Installer [Jekyll], [Bundler] et [Rake]
Pour commencer, vous allez devoir installer [Ruby]. Pour ce faire, allez voir [la documentation](https://www.ruby-lang.org/fr/documentation/installation) qui donne des instruction d'installation pour Linux (Debian, Ubuntu, CentOS, Fedora, RHEL, Gentoo et Arch Linux), MacOS, Windows, Solaris et OpenIndiana.  

[Jekyll], [Bundler] et [Rake] peuvent être installés avec cette commande:
```sh
*$ gem install jekyll bundler rake
Fetching jekyll-3.8.6.gem
Successfully installed jekyll-3.8.6
Parsing documentation for jekyll-3.8.6
Installing ri documentation for jekyll-3.8.6
Done installing documentation for jekyll after 2 seconds
Fetching bundler-2.0.2.gem
Successfully installed bundler-2.0.2
Parsing documentation for bundler-2.0.2
Installing ri documentation for bundler-2.0.2
Done installing documentation for bundler after 4 seconds
Fetching rake-12.3.3.gem
Successfully installed rake-12.3.3
Parsing documentation for rake-12.3.3
Installing ri documentation for rake-12.3.3
Done installing documentation for rake after 0 seconds
3 gems installed
```
**Attention, vous aurez peut-être besoin des droits d'administrateurs pour exécuter cette commande.**  

## Avoir une copie locale du projet
Si vous n'avez pas déjà Git d'installé, vous pouvez l'obtenir pour Linux/Unix, MacOS et Windows [ici](https://git-scm.com/downloads). Une fois installé, [configurez votre nom et votre courriel](https://git-scm.com/book/fr/v2/D%C3%A9marrage-rapide-Param%C3%A9trage-%C3%A0-la-premi%C3%A8re-utilisation-de-Git) avant de continuer.  

Une fois que vous avez installer et configuré Git, vous pouvez cloner le projet à l'aide de la commande.  
```sh
projets$ git clone https://github.com/cyberquebec-org/cyberquebec-org.github.io
Cloning into 'cyberquebec-org.github.io'...
remote: Enumerating objects: 350, done.
remote: Counting objects: 100% (350/350), done.
remote: Compressing objects: 100% (75/75), done.
remote: Total 5399 (delta 207), reused 325 (delta 192), pack-reused 5049
Receiving objects: 100% (5399/5399), 6.69 MiB | 12.19 MiB/s, done.
Resolving deltas: 100% (2420/2420), done.
```
Cela créera un nouveau dossier du nom de `cyberquebec-org.github.io` avec tout le code source du site dans le répertoire où vous avez exécuté la commande.

Vous devez ensuite télécharger les sous modules avec la commande:
```sh
site$ git submodule update --init
Submodule '_sass/bootstrap' (https://github.com/twbs/bootstrap.git) registered for path '_sass/bootstrap'
Submodule 'assets/fontawesome' (https://github.com/FortAwesome/Font-Awesome.git) registered for path 'assets/fontawesome'
Cloning into '/tmp/cyberquebec-org.github.io/_sass/bootstrap'...
Cloning into '/tmp/cyberquebec-org.github.io/assets/fontawesome'...
Submodule path '_sass/bootstrap': checked out '8fa0d3010112dca5dd6dd501173415856001ba8b'
Submodule path 'assets/fontawesome': checked out 'ba907eaec40fab01d410c3023a5572b2cb46cea6'
```
Ce projet contient les sous-modules suivants: [Bootstrap] et [FontAwesome].

## Installer les dépendances
Grâce à [Bundler], toutes les dépendances du projet peuvent être installées en exécutant:
```sh
site$ bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 12.3.3
Using public_suffix 3.1.1
Using addressable 2.6.0
Using bundler 2.0.2
Using colorator 1.1.0
Using concurrent-ruby 1.1.5
Using cssminify2 2.0.1
Using eventmachine 1.2.7
Using http_parser.rb 0.6.0
Using em-websocket 0.5.1
Using execjs 2.7.0
Using ffi 1.11.1
Using forwardable-extended 2.6.0
Using htmlcompressor 0.4.0
Using i18n 0.9.5
Using rb-inotify 0.10.0
Using sass-listen 4.0.0
Using sass 3.7.4
Using jekyll-sass-converter 1.5.2
Using rb-fsevent 0.10.3
Using ruby_dep 1.5.0
Using listen 3.1.5
Using jekyll-watch 2.2.1
Using kramdown 1.17.0
Using liquid 4.0.3
Using mercenary 0.3.6
Using pathutil 0.16.2
Using rouge 3.7.0
Using safe_yaml 1.0.5
Using jekyll 3.8.6
Using json 2.2.0
Using json-minify 0.0.3
Using uglifier 4.1.20
Using jekyll-minifier 0.1.10
Using jekyll-polyglot 1.3.1
Using jekyll-sitemap 1.3.1
Bundle complete! 4 Gemfile dependencies, 36 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```  
**Attention, vous aurez peut-être besoin des droits d'administrateurs pour exécuter cette commande.**  

## Ouvrir un serveur pour faire du développement
Lorsque vous développez le site, vous pouvez exécuter un serveur avec une des deux commandes suivantes:
```sh
site$ bundle exec jekyll serve -wol
# Ou
site$ rake
Configuration file: /home/zakcodes/Downloads/cctt/site/_config.yml
            Source: /home/zakcodes/Downloads/cctt/site
       Destination: /home/zakcodes/Downloads/cctt/site/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
                    done in 18.869 seconds.
 Auto-regeneration: enabled for '/home/zakcodes/Downloads/cctt/site'
LiveReload address: http://127.0.0.1:35729
    Server address: http://127.0.0.1:4000
  Server running... press ctrl-c to stop.
        LiveReload: Browser connected
```
Cette commande ouvre le port `4000` accessible à l'adresse `127.0.0.1:4000` que vous pouvez entrer dans un navigateur Web pour voir le site.  
L'argument `-wol` fait en sorte que [Jekyll]:
* Ouvre automatiquement un nouvel onglet de votre navigateur par défaut à la bonne adresse
* Régénère automatiquement le site lorsque vous enregistrer une modification des fichiers de source (peut importe l'éditeur)
* Rafraîchie les pages ouvertes dans votre navigateur lorsque des pages sont régénérées

## Générer le site pour la production
Vous pourriez exécuter le serveur et copier le répertoire `_site`, mais générer le site en mode production nous donne certains avantage dont l'exécution de [jekyll-minifier] pour réduire la taille des fichiers.  
Vous pouvez donc utiliser une de ces deux commandes pour ce faire:
```sh
site$ `JEKYLL_ENV=production bundle exec jekyll build -d public`
# Ou
site$ rake production_build

```
Cela va générer le site en mode production et le placer dans le dossier `./public`.

## Utiliser [Rake]
Dans les exemples, vous avez pu voir que les commandes utilisez pour générer le site et créer un serveur pour afficher le site sont assez longue, mais qu'elles ont également une courte alternative qui commence par `rake`. C'est parce qu'il y a un fichier `Rakefile` dans ce projet qui contient des raccourcis pour ces commandes. Lorsque vous exécutez la commande `rake` suivi du nom de la tâche à exécuter le programme rake analyse le `Rakefile` pour trouver la tâche demandée et exécute le code qui y est associé.  

Vous pouvez obtenir la liste et la description de toutes les tâches avec la commande:
```sh
site$ rake -AT
rake default           # Exécute le serveur de développement (défaut)
rake dev_build         # Génère le site en mode de développement
rake live_server       # Exécute le serveur de développement (défaut)
rake production_build  # Génère le site en mode de production dans le dossier public
```
Le résultat de cette commande est une liste des commandes que vous pouvez exécuter, donc vous pouvez directement copier la commande dont vous avez besoin et la coller dans le terminal pour l'exécuter. **Toutes ces commandes commençant par `rake` doivent être exécuter dans le dossier du projet.**

# Organisation des dossiers
L'emplacement des fichiers et des dossiers est très important pour [Jekyll]. C'est pour cela que cette section est entièrement dédiée à expliquer qu'est-ce qui se trouve à quel endroit.

## Fichier de configuration
Le fichier `_config.yml` contient la configuration de [Jekyll] ainsi que des plugins utilisés.

## Dossiers de [collections](https://jekyllrb.com/docs/collections/)
La majorité du contenu du site se situe dans les dossiers de collections pour les sources, les risques, les pratiques, les articles (posts) et les conférences. Ces collections sont toutes déclarées dans le fichier de configuration dans la section `collections` sauf pour les articles qui sont une collection présente par défaut.  

Toutes les collections sont facilement accessibles à l'aide des variables `site.collections.collection` et `site.collection` dans [Liquid].

Les fichiers de ces collections doivent être placées dans un dossier du nom de la collection précédé par un `_`. Dans ce projet, les dossiers de collections sont donc `_sources`, `_risques`, `_pratiques`, `_posts` et `_conferences`.

À l'intérieur de ces dossiers se trouvent les documents appartenant à ces collections. Ces documents héritent les propriétés déclarées dans la déclaration de leur collection (dans le fichier de configuration) tel que le `layout` utilisé, s'ils feront partie du site final ou non et leur url (permalink).  

Par défaut, les collections sont placées dans un dossier au nom de la collection dans le dossier de destination du site.  
La collections de conférences est donc placée dans le dossier `conferences` du site, mais les collections de la trousse de cybersécurité remplacent leurs valeurs par défaut pour être placées dans `trousse/sources`, `trousse/risques`, `trousse/pratiques`.  
Les articles ont cependant un emplacement différent et un nom différent de toutes les autres collections. En effet, la date de l'article se trouve dans le nom du fichier qui a le format `an-mois-jour-nom` où nom est le nom de l'article. Les articles sont également placés dans des sous dossiers en fonction de leur date avec ce format `blog/an/mois/jour/nom`. Ce système est pratique, car, si nos fichiers sont classés en ordre alphabétique, ils sont aussi classés en ordre de date.

## Dossier de données (`_data`)
Ce dossier est fait pour ne contenir que des données et aucun fichier qui sera directement visible sur le site contrairement aux collections. Son contenu est facilement accessible avec la variable `site.data` dans toutes les pages avec [Liquid].  
Les fichiers qui y sont placés ne sont donc que des fichiers [YAML] et aucun fichier [Markdown] ou [HTML].  

Pour accéder à une propriété dans un fichier particulier à partir de [Liquid], il faut commencer par `site.data` suivi du chemin du fichier, suivi du chemin de la propriété. Ex.: pour accéder à la propriété `prop.sous-prop` du fichier de données `dossier/sous-dossier`, il faut utiliser la variable `site.data.dossier.sous-dossier.prop.sous-prop`.  

### Traduire les données
On peut facilement traduire les données de ces fichiers grâce à [polyglot]. En effet, la majorité des données sont séparées dans deux dossiers: `en` et `fr`. Les données mises dans ces dossiers sont automatiquement mises directement dans `site.data` en fonction du language actif pour la page dans [Liquid]. Ex.: si on a un fichier `_data/en/contact.yml` et un fichier `_data/fr/contact.yml`, lorsque la page sera en français, `site.data.contact` dans [Liquid] pointera vers le fichier `_data/fr/contact.yml`, sinon, lorsque la page sera en anglais, elle pointera vers `_data/en/contact.yml`.  
Cette technique est utilisée dans ce projet pour traduire le contenu des pages. En effet, plusieurs pages possèdent un seul fichier [HTML] qui fait appel aux données traduites. C'est le cas de `index.html`, `contact.html`, `_layouts/default.html` et à peu près tous les fichiers [HTML].

## Icône d'onglet
Le fichier `favicon.ico` à la racine du dossier du projet et est copier à la racine du site par [Jekyll]. Il sert d'icône affiché dans les onglets.

## Ressources (`assets`)
Ce dossier et la majorité de son contenu est placé directement dans le dossier final du site par [Jekyll]. Il contient les images, le [JavaScritp][JS], le [CSS], et une partie des fichiers [SCSS]. Il contient également un git sumbodule pour [FontAwesome].

### [SCSS]
Les fichiers `scss` sont une exception dans ce dossier. Ils sont automatiquement compilés par [Jekyll]. **Ces fichiers doivent obligatoirement commencer par une entête de [front matter], même si elle est vide, pour être compilés par [Jekyll](https://jekyllrb.com/docs/front-matter/).**

## [SASS]
Le dossier `_sass` contient des fichiers `scss` qui peuvent être inclus dans les fichiers `scss` du dossier `assets/css`. Aucun des fichiers de ce dossier ne seront directement inclus dans le site final, ils ne sont accessible que pour les fichiers `scss` du dossier `assets/css`. Le dossier `_sass` contient également un dossier qui est un git submodule de [Bootstrap] et un fichier `_variables.scss` qui sont inclus dans le fichier `assets/css/main.scss`. Le fichier `_variables.scss` contient des variables de couleurs utilisées pour changer celles par défaut de [Bootstrap] pour utiliser les couleurs de [CyberQuébec.org].

# License
Pour l'instant, ce projet n'a pas de license, mais il reste tout de même la propriété de CyberQuebec.org. Les images se situant dans le dossier `assets/images` n'est pas libre.

# Dépendances
Cette section est une liste non-exhaustive des projets qui sont et pourraient être utilisés pour créer ce site.

## Générateur de sites statiques
[Jekyll] est le générateur de sites statiques utilisé à l'heure actuelle pour faire le site du CCTT. Il a l'avantage d'être déjà supporté nativement par GitHub pages, d'être le plus populaire et d'avoir un système de plugin avec une communauté qui l'entoure.

[Middleman](https://middlemanapp.com/) est cependant aussi considéré à l'heure actuelle, car il possède également un système de plugin (moins développé que [Jekyll]), il est beaucoup plus flexible, on peut l'étendre avec du [Ruby], il supporte l'internationalisation sans utiliser de plugin et il supporte [les tests Cucumber](https://cucumber.io/) qui pourraient être utilisés pour valider les [JSON Schema](https://json-schema.org/) et s'assurer que les traductions de toutes les pages sont faites. Il est cependant à noter qu'il n'est pas officiellement supporté par GitHub Pages et que sa flexibilité le rend plus difficile d'utilisation pour les gens ne connaissant pas [Ruby].

## Style
Pour donner du style au site, [Bootstrap] est utilisé. C'est un outils open source qui peut être utilisé pour donner du style aux sites internets utilisant du [HTML], du [CSS] et du [JS]. Elle est elle-même faite en [JS] et en [SASS] et les librairies [JavaScript][JS] [JQuery (slim build)](https://jquery.com/) et [Popper.js](https://popper.js.org/).  

[Bootstrap] a d'abord été choisi, car c'est la librairie la plus populaire de ce genre et qu'elle est compatible avec tous les navigateurs web.  
Elle possède un système de grille et pleins de classes qui nous permettent de facilement designer notre site pour qu'il soit compatible avec les écrans de toutes les tailles.  
Le fait qu'elle utilise [SASS] plutôt que [CSS] est aussi un énorme avantage, puisqu'on peut modifier les valeurs des variables afin de changer les couleurs du thème de base pour celles du CCTT.  

### [Semantic UI](https://semantic-ui.com/)
Ceci est une alternative à bootstrap qui semble très intéressante, mail [Bootstrap] fait totalement l'affaire.

## Icônes
Pour afficher des icônes, [FontAwesome] est utilisé. C'est une librairie opensource qui fournit [1500+ icônes gratuits](https://fontawesome.com/icons?d=gallery&m=free), dont des icônes de logo de certaines compagnies et médias sociaux.  
[Cette section de leur site](https://fontawesome.com#easy-to-use) donne un exemple interactif de comment utiliser les icônes en [HTML].

## I18n
Le plugin utilisé pour l'internationalisation (la traduction du site dans différents languages) est [polyglot]. Il a été choisi car:
* Il fournit un [`liquid tag`]() pour implémenter faire du SEO pour un site multilingue.
* Il permet de mettre les fichiers de données (`_data`) dans des dossiers pour chaque langue et ensuite il nous donne accès aux données de la langue active sans aucune configuration nécessaire.
* Il traduit automatiquement les liens.

Cependant, il pourrait être amélioré de telles façons:
* Il pourrait nous permettre de mettre tous les autres fichiers de collections dans des dossiers pour chaque langues et les ramener au top level.
* Il pourrait assumer la langue d'un fichier si son nom suit ce format `nom.lang.ext` où `lang` est la langue du fichier.
* Il pourrait assumer le permalink d'un fichier si son nom suit ce format `nom.lang.ext` où `lang` est la langue du fichier en ne prenant que nom et en remplaçant le nom par `/` s'il est `index`.

D'autres options ont étés considérées, elles n'étaient pas aussi faciles d'utilisation et n'avaient pas autant de fonctionnalités. En voici certaines:
* [jekyll-multiple-languages-plugin](https://github.com/kurtsson/jekyll-multiple-languages-plugin)
    * 4 à 5x plus populaire que [polyglot]
    * Maintenue beaucoup plus activement
    * Permet de traduire les liens vers les pages
    * Ne traduit pas les fichiers de données

## Génerateur de [HTML] pour [Markdown]
[kramdown] est celui par défaut pour [Jekyll] ainsi que celui qui est utilisé en ce moment. En plus des fonctionnalités du standard [Markdown], [kramdown] nous permet de [d'ajouter des classes et des IDs aux éléments](https://kramdown.gettalong.org/syntax.html#attribute-list-definitions), ce qui pourrait nous être très utile.  
Cependant, [kramdown] ne respecte pas totalement le standard [Markdown], mais pour l'utilisation que nous allons en faire, nous ne devrions pas être affectés.
Pour le formattage du code par [kramdown], [Rouge](http://rouge.jneen.net/) (écrite en [Ruby]) est la librairie utilisée. Les classes utilisées pour le [HTML] du code sont les mêmes que celles utilisées par un autre formatteur de code du nom de [Pygments] (écrit en [Ruby]). Grâce à cela, nous pouvons utiliser n'importe quel stylesheet destinée à [Pygments]. Celle utilisée à l'heure actuelle est `monokai` (le thème utilisé dans [Sublime Text](https://www.sublimetext.com/)), qui fut prit de [ce site](http://jwarby.github.io/jekyll-pygments-themes/languages/javascript.html) où nous pouvons choisir un autre thème.  

[CommonMark] est un standard de [Markdown] que nous pourrions utilisé grâce à [un plugin pour Jekyll](https://github.com/jekyll/jekyll-commonmark). Ce plugin fait partie des projets des développeurs de [Jekyll] et est plus performant que [kramdown], car [CommonMark] est implémenté en [C](https://www.iso.org/standard/74528.html) alors que [kramdown] est fait en [Ruby]. Par contre, nous perdrions la fonctionnalité de pouvoir ajouter des `classes` et des `id` aux éléments [HTML].

[Textile] est une alternative au [Markdown] supportée par [Jekyll]. Elle est beaucoup plus flexible que le [Markdown], car elle permet d'utiliser n'importe quel élément en [HTML] en le désignant par son nom sans utiliser de [HTML] et de lui assigner une classe et,ou un id. Elle est cependant plus compliqué à utiliser et sa syntaxe rend le texte brute moins clair que le [Markdown], mais une fois le [HTML] généré il n'y aurait aucune différence. Elle est également beaucoup moins utilisé, donc je ne pense pas qu'on devrait y passer pour tous les documents, cependant, si on en a besoin, on peut quand même utiliser.

## Optimisation de moteurs de recherche (SEO)
L'optimisation de moteurs de recherche et un groupe de techniques utilisées pour mieux informer le moteur de recherche sur le contenu de notre site et de ses pages pour qu'elles soient indexées.

[Jekyll SEO](https://github.com/jekyll/jekyll-seo-tag) est un plugin pour [Jekyll]

[jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap) permet de générer un fichier [sitemap.xml](https://www.sitemaps.org/protocol.html) pour les moteurs de recherches. Ce fichier contient des liens vers chaque page du site, afin qu'un moteur de recherche puisse trouver le site de cyberquébec et utiliser ce site pour facilement indexer toutes ses pages.

[polyglot] donne également de [bons conseils sur le SEO](https://polyglot.untra.io/en/seo/), mais ses conseils sont par rapport aux sites multilingues.

## Minifier
Un minifier est un programme qui va retirer tous les caractères qui ne sont pas nécessaires des fichiers [HTML], [CSS], [JS] et autres afin qu'ils prennent moins de place et soient envoyés plus vite et que les pages chargent plus rapidement.  
Le minifier utilisé est un plugin de [Jekyll] du nom de [jekyll-minifier](https://github.com/digitalsparky/jekyll-minifier), mais il n'est exécuté qu'en mode production. Ceci est une bonne chose, car ça nous permet de pouvoir lire le code source plus facilement et d'avoir accès aux commentaires dans le navigateur pour faire du déboggage lors du développement.  

## Recherche de contenu sur le site
### [lunr.js](https://learn.cloudcannon.com/jekyll/jekyll-search-using-lunr-js/)
C'est est une librairies en [JavaScript][JS] que nous pourrions utiliser avec [Jekyll] pour que les utilisateurs puissent chercher dans le contenu de la trousse de cybersécurité ou dans les articles.

### [Algolia](https://www.algolia.com/)
Ceci est un service de recherche que j'ai vu être utilisé par plusieurs sites statiques tel que le site officiel de [Hugo](https://gohugo.io/) et [la documentation de GitLab](https://about.gitlab.com/). Il est gratuit pour les projets open source non commerciaux et commence à 29USD/mois pour 250 000 opérations et 50 000 documents. Leur API semble aussi être super performant.

Il serait intéressant de trouver une alternative open source à ce service, même s'il est payant, pour contribuer au OpenSource plutôt qu'à une compagnie privée: https://alternativeto.net/software/algolia/

[CyberQuébec.org]: https://cyberquebec.org
[Jekyll]: https://jekyllrb.com
[Bundler]: https://bundler.io/
[Rake]: https://ruby.github.io/rake/
[Ruby]: https://www.ruby-lang.org/
[Python]: https://python.org
[Liquid]: https://shopify.github.io/liquid
[polyglot]: https://github.com/untra/polyglot
[Markdown]: https://wikipedia.org/wiki/Markdown
[kramdown]: https://kramdown.gettalong.org/
[CommonMark]: https://commonmark.org/
[Pygments]: http://pygments.org/
[Bootstrap]: https://getbootstrap.com
[FontAwesome]: https://fontawesome.com/
[HTML]: https://www.w3.org/html/
[CSS]: https://www.w3.org/Style/CSS/
[SASS]: https://sass-lang.com/
[JS]: https://www.ecma-international.org/publications/standards/Ecma-262.htm
