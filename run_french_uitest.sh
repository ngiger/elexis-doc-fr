#!/bin/bash -v
cd `dirname $0`/elexis-uitest
mvn clean install -f h2/pom.xml -Dlanguage=fr -Dsuite2run=QuickTestSuite -DautExplicit=../../target/products/ch.elexis.base.application.ElexisBaseApp/linux/gtk/x86_64
