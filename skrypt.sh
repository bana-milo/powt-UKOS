#!/bin/bash

# 1. Parametry i sprawdzanie ich 

ft_parm="2022|2023"
sd_parm="[0-9]+"
td_parm="[0-9]+"

if [ $# != 3 ]
then
	echo "Zla ilosc argumentow!"
	exit 1
fi

if ! [[ $1 =~ $ft_parm ]]
then
	echo "Podano zly rok!"
	exit 2
fi

if ! [[ $2 =~ $sd_parm ]]
then
	echo "Drugi parametr to nie jest liczba!"
	exit 2
fi

if ! [[ $3 =~ $td_parm ]]
then
	echo "Trzeci parametr to nie jest liczba!"
	exit 3
fi

# 1. Utworzenie Struktury Katalogow
mkdir Powtorzenie
cd Powtorzenie
mkdir "Kartki Swiateczne" Pozostale "Prace Domowe" Zadania
cd "Kartki Swiateczne"
mkdir Kotki Pieski
cd ..
cd Pozostale
mkdir "Listy zakupow" Przepisy
cd "Listy zakupow"
mkdir "Swieta 2022" "Swieta 2023"
cd ..

# 2. i 3. Tworzenie listy zakupow

cd Przepisy
echo "świeża mięta
1 kg jabłek
1 kg cytryn
500 g kiszonej kapusty
1 mała główka świeżej kapusty
80 g suszonych, leśnych grzybów
200 g suszonych jabłek, śliwek, gruszek
4 kg ziemniaków
500 g drobnej, białej fasoli
bułka tarta
1 kg cukru
1 l barszczu w kartonie" > "Lista zakupow $1.txt"


# 4. Sortowanie tresci listy zakupowej

mv "Lista zakupow $1.txt" ../"Listy zakupow"/"Swieta $1"
cd ../"Listy zakupow"/"Swieta $1"


grep "1 kg" "Lista zakupow $1.txt" > ../"Ciezkie.zakupy.txt"
grep "4 kg" "Lista zakupow $1.txt" >> ../"Ciezkie.zakupy.txt"
# 5. Wybrane zakupy

head -$2 "Lista zakupow $1.txt" >> ../"Wybrane zakupy.txt"
tail -$3 "Lista zakupow $1.txt" >> ../"Wybrane zakupy.txt"

# 6. Kompresja

cd ../../..
indeks="s32990"
data=`date +%Y-%m-%d`
tar -cz -f Powtorzenie_${data}_${indeks}.tar.gz ../Powtorzenie* 2> /dev/null 
