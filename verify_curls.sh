#!/bin/bash

echo "=== VERIFICARE CURENTA ==="

check_url() {
  local label=$1
  local url=$2
  local target_text=$3
  local mechanical_text=$4

  echo -e "\n--- $label ---"
  echo "> curl normal"
  curl -sL "$url" | grep -Ei "$target_text|$mechanical_text" || true
  echo "> curl no-cache"
  curl -sL -H "Cache-Control: no-cache" "$url" | grep -Ei "$target_text|$mechanical_text" || true
  echo "> curl Googlebot"
  curl -sL -A "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" "$url" | grep -Ei "$target_text|$mechanical_text" || true
}

check_url "DINOZAURI" "https://www.kassia.ro/animatori-tematica-dinozauri-bucuresti/" "Animatori cu tematică dinozauri pentru copii în București|Animatori tematică dinozauri București|tematică dinozauri|De ce să alegi animatori cu tematică dinozauri|Rezervă animatori cu tematică dinozauri|Cât timp stă un animator cu tematică dinozauri" "Animatori Petreceri Copii animatori|în animatori tematica dinozauri"

check_url "UNICORN" "https://www.kassia.ro/animatori-tematica-unicorn-bucuresti/" "Animatori cu tematică unicorn pentru copii în București|Animatori tematică unicorn București|tematică unicorn|De ce să alegi animatori cu tematică unicorn|Rezervă animatori cu tematică unicorn|Cât timp stă un animator cu tematică unicorn" "Animatori Petreceri Copii animatori|în animatori tematica unicorn"

check_url "JUNGLA" "https://www.kassia.ro/animatori-tematica-jungla-bucuresti/" "Animatori cu tematică junglă pentru copii în București|Animatori tematică junglă București|tematică de junglă|De ce să alegi animatori cu tematică de junglă|Rezervă animatori cu tematică de junglă|Cât timp stă un animator cu tematică de junglă" "Animatori Petreceri Copii animatori|în animatori tematica jungla"

check_url "SPATIU" "https://www.kassia.ro/animatori-tematica-spatiu-bucuresti/" "Animatori cu tematică spațiu pentru copii în București|Animatori tematică spațiu București|tematică de spațiu|De ce să alegi animatori cu tematică de spațiu|Rezervă animatori cu tematică de spațiu|Cât timp stă un animator cu tematică de spațiu" "Animatori Petreceri Copii animatori|în animatori tematica spatiu"
