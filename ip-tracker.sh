from color import *
from pyngrok import *
import requests
import os


http_tunnel = ngrok.connect()

ssh_tunnel = ngrok.connect(22, "tcp")

'''

Turkish Menu

'''

def TR_menu():

    check_internet()
    print(F"{red}I{red}{blue}P{blue} {yellow}T{yellow}{cyan}R{cyan}{green}A{green}{blue}C{blue}{red}K{red}{yellow}E{yellow}R")
    print(f"{blue}[1]{blue} IP Tracker\n{blue}[2]{blue} Emegi Gecenler\n")
    casualFont()
    secim = str(input(":  "))
    if secim == "1":
        print(F"{green}Baslatiliyor...{green}")
        ip()
    elif secim == "2":
        emegiGecenler()
        secim = str(input("Geriye donmek istermisiniz?(1=Geri, 2=Cikis):  "))
        if secim == "1":
            TR_menu()
        elif secim == "2":
            print("Cikis yapiliyor...")
            exit()
        else:
            print('Yanlis Deger.')
            
    else:
        print(F"{red}Yanlis Deger Girdiniz.{red}")
        TR_menu()

def casualFont():
    print(normal)

def emegiGecenler():
    print(f"{green} Yapimci: ir0n{green}\n {blue}Destekleyenler: Apeli07 {blue}")


def check_internet():
    timeout = 5.
    url = "https://www.google.com/"
    
    try:
        request = requests.get(url, timeout = timeout)
        print(f"{green} [ + ] Internet Bagli. {green}")
        
    except (requests. ConnectionError, requests. Timeout) as exception:
        print(f"{red} [ - ] Internet Baglantinizi Kontrol Ediniz Lutfen. {red}")
        casualFont()
        exit()

def ip():
    try:
        ip = str(input(f"{cyan}Ip adresi:{cyan}  "))
        casualFont()
        url = ("http://ipwhois.app/json/" + ip)
    
        requestIP = requests.get(url)
        contentIP = requestIP.content 
        data = requestIP.json()
        country = data["country"]
        ipType = data["type"]
        isp = data["isp"]
        countryCode = data["country_code"]
        bolge = data["continent"]
        bolgeCode = data["continent_code"]
        baskent = data["country_capital"]
        tel_code = data["country_phone"]
        dolarKur = data["currency_rates"]
        money = data["currency"]
        moneyCode = data["currency_code"]
        moneySymbol = data["currency_symbol"]
        city = data["city"]
        enlem = data["latitude"]
        boylam = data["longitude"]
        zamanzone = data["timezone"]
        zamandilimi = data["timezone_name"]
    
        print(F'''

            IP: {blue}{ip}{blue}{normal}
            ÜLKE: {country}
            İP Tipi: {ipType}
            BÖLGE KODU: {bolgeCode}
            ÜLKE KODU: {countryCode} 
            BAŞKENTİ: {baskent}
            ÜLKE TELEFON KODU: {tel_code}
            ŞEHİR: {city}
            BÖLGE: {bolge}
            ENLEM: {enlem}
            BOYLAM: {boylam}
            ISP: {isp}
            ZAMAN KUŞAĞI: {zamanzone}
            ZAMAN DİLİMİ: {zamandilimi}
            PARA BİRİMİ: {money} 
            PARA SEMBOLU: {moneySymbol}
            ÜLKEDEKİ DOLAR KURU: {dolarKur}

            ''')
        saveIPinformation = str(input(f"{cyan}Bilgileri kaydetmek istermisiniz ?{cyan}:  "))
        casualFont()
        if saveIPinformation == "e" or saveIPinformation == "E":
            with open("ip.txt",'a', encoding="utf-8") as ipdosya:
                ipdosya.write(f"        IP: {ip}\n        ÜLKE: {country}\n        İP Tipi: {ipType}\n        BÖLGE KODU: {bolgeCode}\n        ÜLKE KODU: {countryCode}\n        BAŞKENTİ: {baskent}\n        ÜLKE TELEFON KODU: {tel_code}\n        ŞEHİR: {city}\n        BÖLGE: {bolge}\n        ENLEM: {enlem}\n        BOYLAM: {boylam}\n        ISP: {isp}\n        ZAMAN KUŞAĞI: {zamanzone}\n        ZAMAN DİLİMİ: {zamanzone}\n        PARA BİRİMİ: {money}\n        PARA SEMBOLU: {moneySymbol}\n        ÜLKEDEKİ DOLAR KURU: {dolarKur}")
        elif saveIPinformation == "h" or saveIPinformation == "H":
            print("Bilgiler Kaydedilmedi.")
            secim = str(input(f"{cyan}Menuye donmek istermisiniz?:{cyan}  "))
            if secim == "y" or secim == "Y":
                TR_menu()
            elif secim == "n" or secim == "N":
                print("Cikis yapiliyor...")
                exit()
    except (TypeError,NameError,IndexError,KeyError,KeyboardInterrupt):
        print("Yanlis deger girdiniz.")
        ip()        

'''
English Language
'''
def EN_menu():
    '''
    There is menu. Menu is easier to our works.

    '''
    try:
        EN_check_internet()
        print(F"{red}I{red}{blue}P{blue} {yellow}T{yellow}{cyan}R{cyan}{green}A{green}{blue}C{blue}{red}K{red}{yellow}E{yellow}R")
        print(f"{blue}[1]{blue}IP Tracker\n{blue}[2]{blue}Who contributed \n")
        casualFont()
        secim = str(input(":  "))
        if secim == "1":
            print(F"{green}Starting...{green}")
            ip()
        elif secim == "2":
            EN_emegiGecenler()
            secim = str(input("Do you want to go back?(1=Back, 2=Exit):  "))
            if secim == "1":
                EN_menu()
            elif secim == "2":
                print("Exiting...")
                exit()
        else:
            print(F"{red}You entered the wrong value.{red}")
            EN_menu()
    except (KeyboardInterrupt):
        print(F"{red}You entered the wrong value.{red}")
        EN_menu()

def casualFont():
    print(normal)

def EN_emegiGecenler():
    print(f"{green} Creator: ir0n{green}\n {blue}Supporters: Apeli07 {blue}")

def EN_check_internet():
    timeout = 5.
    url = "https://www.google.com/"
    
    try:
        request = requests.get(url, timeout = timeout)
        print(f"{green} [ + ] Connected to the Internet. {green}")
        
    except (requests. ConnectionError, requests. Timeout) as exception:
        print(f"{red} [ - ] Please Check Your Internet Connection. {red}")
        casualFont()
        exit()

def EN_ip():
    try:
        ip = str(input(f"{cyan}Ip address:{cyan}  "))
        casualFont()
        url = ("http://ipwhois.app/json/" + ip)
        
        requestIP = requests.get(url)
        contentIP = requestIP.content 
        data = requestIP.json()
        country = data["country"]
        ipType = data["type"]
        isp = data["isp"]
        countryCode = data["country_code"]
        bolge = data["continent"]
        bolgeCode = data["continent_code"]
        baskent = data["country_capital"]
        tel_code = data["country_phone"]
        dolarKur = data["currency_rates"]
        money = data["currency"]
        moneyCode = data["currency_code"]
        moneySymbol = data["currency_symbol"]
        city = data["city"]
        enlem = data["latitude"]
        boylam = data["longitude"]
        zamanzone = data["timezone"]
        zamandilimi = data["timezone_name"]

        
        print(F'''

            IP: {blue}{ip}{blue}{normal}
            COUNTRY: {country}
            İP TYPE: {ipType}
            REGION CODE: {bolgeCode}
            COUNTRY CODE: {countryCode} 
            CAPITAL: {baskent}
            COUNTRY PHONE CODE: {tel_code}
            CITY: {city}
            REGION: {bolge}
            LATITUDE: {enlem}
            LONGITUDE: {boylam}
            ISP: {isp}
            TIME ZONE: {zamanzone}
            TIME PERIOD: {zamandilimi}
            CURRENCY: {money} 
            CURRENCY SYMBOL: {moneySymbol}
            CURRENCY RATES: {dolarKur}

            ''')
        saveIPinformation = str(input(f"{cyan}Do you want to save the information?{cyan}:  "))
        casualFont()
        if saveIPinformation == "e" or saveIPinformation == "E":
            with open("ip.txt",'a', encoding="utf-8") as ipdosya:
                ipdosya.write(f"        IP: {ip}\n        COUNTRY: {country}\n        İP TYPE: {ipType}\n        REGION CODE: {bolgeCode}\n        COUNTRY CODE: {countryCode}\n        CAPITAL: {baskent}\n        COUNTRY PHONE CODE: {tel_code}\n        CITY: {city}\n        REGION: {bolge}\n        LATITUDE: {enlem}\n        LONGITUDE: {boylam}\n        ISP: {isp}\n        TIME ZONE: {zamanzone}\n        TIME PERIOD: {zamanzone}\n        CURRENCY: {money}\n       CURRENCY SYMBOL: {moneySymbol}\n        CURRENCY RATES: {dolarKur}")
        elif saveIPinformation == "h" or saveIPinformation == "H":
            print("Information Not Saved.")
            secim = str(input(f"{cyan}Would you like to return to the menu?:{cyan}  "))
            if secim == "y" or secim == "Y":
                EN_menu()
            elif secim == "n" or secim == "N":
                print("Exiting...")
                exit()
    except:
        print("You entered the wrong value.")
        EN_ip()

def Language():
    lang = str(input("EN = English  ,  TR = Turkish:  "))
    
    if (lang == "tr" or lang == "TR") or (lang == "TURKISH" or lang == "turkish"):
        agreement = input(F"{red}BU ARACI KULLANARAK SORUMLULUĞU KENDİN/KENDİNİNİZ ALMAKTASINIZ{red} {yellow}ONAYLIYOR MUSUNUZ?{yellow} (E/H):  ")
        print('Hosgeldiniz\nAciliyor...')
        if (agreement == "e" or agreement == "E" ):
            print("OK")
            with open("ok.txt",'a',encoding= "utf-8") as file:
                file.write("Okey\n")
            TR_menu()
        elif (agreement == "h" or agreement == "H"):
            print(F"{red}Cikis Yapilir...{red}")
            exit()
        else:
            print(F"{red} Gecersiz Islem. Sadece (E/e = Yes, H/h = No) {red}")

    elif (lang == "en" or lang == "EN") or (lang == "ENGLISH" or lang == "english"):
        agreement = input(F"{red}BY USING THIS TOOL, YOU ARE YOURSELF / OWN RESPONSIBILITY{red} {yellow}DO YOU CONFIRM?{yellow} (Y/N):  ")
        print('Welcome\nStarting...')
        if (agreement == "y" or agreement == "Y" ):
            print("OK")
            with open("ok.txt",'a',encoding= "utf-8") as file:
                file.write("Okey\n")
            EN_menu()


        elif (agreement == "n" or agreement == "N"):
            print(F"{red}Exiting...{red}")
            exit()
        
        else:
            print("You entered the wrong value. just (Y/N)")


Language()
