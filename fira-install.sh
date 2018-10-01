#! /bin/sh

# Verifica se o curl está instalado e instala caso não estiver...
echo "Verificando dependências..."

if ! which curl
then
    apt-get update -qq
    apt-get install curl -y
fi

if ! which unzip
then
    apt-get update -qq
    apt-get install unzip -y
fi

echo "Baixando o pacote de fontes..."

# Faz o download do arquivo da fonte direta dos criadores da fonte Fira.
curl https://codeload.github.com/bBoxType/FiraSans/zip/master -o $(pwd)/master.zip --progress-bar

# Verifica se o Unzip está instalado...
echo "Instalando as fontes..."
unzip $(pwd)/master.zip

mkdir -p /usr/share/fonts/opentype/fira_code && \
mkdir -p /usr/share/fonts/opentype/fira_mono && \
mkdir -p /usr/share/fonts/opentype/fira_sans

cp -r $(pwd)/FiraSans-master/Fira_Code_*/**/* /usr/share/fonts/opentype/fira_code && \
cp -r $(pwd)/FiraSans-master/Fira_Mono_*/**/* /usr/share/fonts/opentype/fira_mono && \
cp -r $(pwd)/FiraSans-master/Fira_Sans_*/**/* /usr/share/fonts/opentype/fira_sans

echo "Limpando a sujeira..."
rm $(pwd)/master.zip
rm -r $(pwd)/FiraSans-master

echo "Feito!"
