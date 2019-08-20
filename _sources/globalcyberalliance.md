---
title: Global Cyber Alliance
lien: https://www.globalcyberalliance.org
lang:
    - eng
type: organisme-international
partenaires:
    Police de la ville de Londres: https://www.cityoflondon.police.uk/
    Bureau du procureur du district de Manhattan: https://manhattanda.org
    CIS: /trousse/sources/cis
categories: []
---
Cette organisation internationale fut fondée afin de faire de la sensibilisation à la cybersécurité après avoir fait la réalisation que, surtout en cybersécurité, il vaut mieux prévenir que guérir. Elle fait des recherches sur les incidents de cybersécurité, créée et encourage certaines initiatives, créée des ressources pour sensibiliser les entreprises à la cybersécurité et développent des outils de cybersécurité.

### Recherches
Le [GCA] effectue de la recherche en cybersécurité. Ils publient leurs résultats dans 2 documents: le rapport complet et le résumé exécutif. Le résumé exécutif est un résumé du rapport fait en quelques pages.

### [Promotion de DMARC](https://www.globalcyberalliance.org/dmarc/)
Le GCA est un adepte de DMARC qui sert à prévenir des tiers d'envoyer des courriels d'un domaine qui ne leur appartient pas.  
Ils ont également créé [un outils open source](https://github.com/GlobalCyberAlliance/GCADMARCRiskScanner) pour vérifier si un domaine d'adresse courriel utilise [DMARC](https://dmarc.org/), [DKIP](http://www.dkim.org/) et/ou [SPF](https://tools.ietf.org/html/rfc7208) qui peut être utilisé à partir de [ce lien](https://dmarcguide.globalcyberalliance.org/).

### [Quad9 DNS](https://www.globalcyberalliance.org/quad9/)
[Quad9](https://quad9.net/) est un service DNS à l'adresse `9.9.9.9` appuyé par [IBM](https://www.ibm.com), [PCH](https://www.pch.net/) et [GCA].  
Il a pour but de bloquer les domaines représentant des menaces connus afin de protéger les utilisateurs.
Des instructions de configuration de [Quad9](https://quad9.net/) sur [MacOS](https://quad9.net/apple/) et [Windows](https://quad9.net/microsoft/).  
**TODO configurer un DNS sur Android et iOS. Il n'y a pas de moyen de changer le DNS global à partir des paramètres de le faire au niveau global avant Android P**

### Trousses de cybersécurité
Le [GCA] a créé deux trousses de cybersécurité.

#### [Trousse de cybersécurité pour les petites entreprises](https://gcatoolkit.org/smallbusiness/)
(financée par MasterCard)
Disponible seulement en anglais, cette trousse financée par [MasterCard](https://www.mastercard.ca) est composée de petites capsules vidéos et, contrairement aux autres ressources, elle donne des recommandations d'outils pour aider à l'implémentation de mesures de cybersécurité.  
> Certaines des vidéos sont de moins bonne qualité, car elles ne sont que des vidéos d'une fausse main écrivant sur un tableau avec de la musique en arrière-plan.

#### [Trousse de cybersécurité pour les éléctions](https://gcatoolkit.org/elections/)
TODO

#### [McScrapy]
[GCA] a aussi créé [l'outils open source](https://github.com/GlobalCyberAlliance/GCAMcScrapy) [McScrapy].  
ce programme parcours un site Internet dynamique et enregistre toutes ses pages pour en faire un site statique. Il explore tous les liens et s'assure qu'ils sont sécuritaires.  
L'outils a été fait pour pouvoir utiliser les outils CMS en toute sécurité. La combinaison de [PHP](https://php.net/) et de [Javascript](https://www.ecma-international.org/publications/standards/Ecma-262.htm) qu'ils utilise est la cause de nombreuses vulnérabilités. WordPress, par exemple, a [près de 2500 vulnérabilités](https://wpvulndb.com/statistics).  

[GCA]: https://www.globalcyberalliance.org
[McScrapy]: https://www.globalcyberalliance.org/mcscrapy/
