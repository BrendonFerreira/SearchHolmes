#!/usr/bin/env bash

CONFIG_SITES_FILE="`dirname $0`/config/searchSites.txt"

function add {
    echo $1 >> $CONFIG_SITES_FILE
}

function search {
    RED='\033[0;32m'
    NC='\033[0m'
    cat $CONFIG_SITES_FILE | while read site
    do
        echo ""
        echo "------------------------------"
        echo -e "${RED}Resultado da pesquisa por $1 no site $site ${NC}"
        echo $(lynx -dump -nolist $site | grep -i $1)
        echo "------------------------------"
        echo ""
    done
}

function list {
    cat $CONFIG_SITES_FILE
}

$@
