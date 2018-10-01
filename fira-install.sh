#! /bin/sh

# Verifica se o curl está instalado e instala caso não estiver...
echo "Verificando dependências..."

if ! which curl
then
    apt-get update -qq
    apt-get install curl
fi

if ! which unzip
then
    apt-get update -qq
    apt-get install unzip
fi

echo "Baixando o pacote de fontes..."

# Faz o download do arquivo da fonte direta dos criadores da fonte Fira.
curl https://codeload.github.com/bBoxType/FiraSans/zip/master -o /home/$USER/master.zip -s

# Verifica se o Unzip está instalado...
echo "Instalando as fontes..."
unzip /home/$USER/master.zip

mkdir -p /usr/share/fonts/opentype/fira_code
mkdir -p /usr/share/fonts/opentype/fira_mono
mkdir -p /usr/share/fonts/opentype/fira_sans

cp /home/$USER/master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/* /usr/share/fonts/opentype/fira_code
cp /home/$USER/master/Fira_Mono_3_2/Fonts/FiraMono_OTF_32/* /usr/share/fonts/opentype/fira_mono
cp /home/$USER/master/Fira_Sans_4_2/Fonts/FiraSans_OTF_4203/Compressed/Roman/* /usr/share/fonts/opentype/fira_sans
cp /home/$USER/master/Fira_Sans_4_2/Fonts/FiraSans_OTF_4203/Compressed/Italic/* /usr/share/fonts/opentype/fira_sans
cp /home/$USER/master/Fira_Sans_4_2/Fonts/FiraSans_OTF_4203/Condensed/Roman/* /usr/share/fonts/opentype/fira_sans
cp /home/$USER/master/Fira_Sans_4_2/Fonts/FiraSans_OTF_4203/Condensed/Italic/* /usr/share/fonts/opentype/fira_sans
cp /home/$USER/master/Fira_Sans_4_2/Fonts/FiraSans_OTF_4203/Normal/Roman/* /usr/share/fonts/opentype/fira_sans
cp /home/$USER/master/Fira_Sans_4_2/Fonts/FiraSans_OTF_4203/Normal/Italic/* /usr/share/fonts/opentype/fira_sans

echo "Limpando a sujeira..."
rm /home/$USER/master.zip
rm -r /home/$USER/master

echo "Feito!"
