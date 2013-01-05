#!/bin/sh

COUNT=`cat tagfile/a_pkg | grep ADD | wc -l`
PKG_COUNT=COUNT

COUNT=`cat tagfile/d_pkg | grep ADD | wc -l`
PKG_COUNT=$((PKG_COUNT+COUNT))
	
COUNT=`cat tagfile/l_pkg | grep ADD | wc -l`
PKG_COUNT=$((PKG_COUNT+COUNT))

COUNT=`cat tagfile/n_pkg | grep ADD | wc -l`
PKG_COUNT=$((PKG_COUNT+COUNT))

echo "$PKG_COUNT"

PKG_INSTALLED=1

cd tagfile

(
for PKG_NAME in a_pkg l_pkg d_pkg n_pkg; do
echo $PKG_NAME
    echo "$PERC"

    sleep 1 
    
    PERC=`echo "($PKG_INSTALLED*100)/$PKG_COUNT" | bc`
    PKG_INSTALLED=$((PKG_INSTALLED+1))
    
done
) #| dialog                                     \
 #--title 'Instalação dos Pacotes'        \
#--gauge '\nInstalando Vim-6.0a.tgz...'  \
# 8 40 0


