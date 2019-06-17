# elexis-doc-fr: A customized Elexis for generating the images used by the french docu Premiers_pas_avec_Elexis

Author: Niklaus Giger <niklaus.giger@member.fsf.org>

Date: May 01, 2019

This a utility project by Niklaus Giger to ease creating the documentation for the french version of Elexis.

It should create images of the current master version of Elexis3 for https://wiki.elexis.info/Premiers_pas_avec_Elexis.

Besides the elexis-3-core it contains the following features
* Mediport (for sending XML invoicing to Medidata)
* Agenda
* Impfplan
* Omnivore
* Hilotec ODF Textplugin (This is Elexis 3.8, where it works. Not 3.7 where it has problems)
* Afinion AS100 laboratroy equipment
* External Viollier laboratory

## Requirements

* A current linux distribution, eg. I use Debian Stretch, having installed the following packages
** openjdk-8-jdk (openjdk-11-jdk or oracle jdk should be okay, too)
** maven (I have 3.6.0)
** git
* In this guide a assume as architecture x864_64
* For macOSX or windows you must replace in the pom.xml the environment definition to point it to your architecture

## Building the ElexisBaseApp

* Create a new, empty directory with around 1 GB of free space and cd into it
* `git clone https://github.com/ngiger/elexis-doc-fr.git .`
* `mvn clean install`

This will create target/products/ch.elexis.base.application.ElexisBaseApp-linux.gtk.x86_64.zip

## Building the images via RCPTT

TODO: Does not yet work

## Remarks

This project also illustrates how easy it is to create a new customized Elexis consting of
* The elexis-3-core
* Some additional features from the elexis-3-base repository (see the list in the features element of ElexisBase.product
* You want other branches or repositories adapt the repositories element in the pom.xml

### How we included the OpenJDK

We got the inspiration from  https://github.com/buchen/bundled-jre.

From a license perspective, we wanted to use the [OpenJDK](http://openjdk.java.net/) for Elexis.

The OpenJDK itself is not providing binaries for all platforms, but thankfully Azul does with [Zulu](https://www.azul.com/downloads/zulu/).

#### The Idea

In short, the idea is outlined in the blog post [Including a JRE in a Tycho build](https://codeiseasy.wordpress.com/2012/07/31/including-a-jre-in-a-tycho-build/).

The [Tycho](https://www.eclipse.org/tycho/) build in this repository does:

* Download the JDK builds from [Zulu](https://www.azul.com/downloads/zulu/)
* Create bundles with the appropriate ```setJvm``` [p2 Touchpoint Instructions](http://help.eclipse.org/oxygen/index.jsp?topic=/org.eclipse.platform.doc.isv/guide/p2_actions_touchpoints.html)
* Create a feature with all JRE bundles and the main Elexis features
* Create the Elexis3 application with self-update functionality to test the packaged JRE

