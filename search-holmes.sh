#!/usr/bin/env bash

# Pega o caminho das configurações baseado no caminho que se encontra
CONFIG_SITES_FILE="`dirname $0`/config/searchSites.txt"

# Funcao que adiciona um site na lista
function add {
    echo $1 >> $CONFIG_SITES_FILE
}

# Funcao que procura 
function search {
    
    #Cria variaveis para dar cor ao titulo
    #Cor verde
    VERDE='\033[0;32m'
    #Não cor
    NC='\033[0m'
    
    #Lê cada site do arquivo de configuração
    cat $CONFIG_SITES_FILE | while read site
    do
        echo ""
        echo "------------------------------"
        
        # O inicio ${VERDE} inicia a cor e o  ${NC} finaliza a cor
        echo -e "${VERDE}Resultado da pesquisa por $1 no site $site ${NC}"
        
        # A utilização do lynx vem da necessidade de um texto limpo
        # Sem tags html
        # os parametros passados significam:
        # - dump : Pega como texto a saida do lynx
        # - nolist : Remove as listas de navegação
        #
        # Para o grep temos o parametro "-i" que significa
        # a procura por ocorrencias sem levar em consideração 
        # se é maiusculo ou minusculo
        echo $(lynx -dump -nolist $site | grep -i $1)
        echo "------------------------------"
        echo ""
    done
}

# Lista os sites configurados 
function list {
    cat $CONFIG_SITES_FILE
}

# Limpa a lista de sites
function clear {
    echo '' > $CONFIG_SITES_FILE
}

$@
