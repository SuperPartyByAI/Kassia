#!/bin/bash
URL="https://www.kassia.ro/animatori-petreceri-copii/"
# Fetch fresh with curl
HTML=$(curl -s "$URL")

echo "--- NEGATIVE CHECKS ---"
echo "duplicate FAQ noi în HTML vizibil (asteptam 2 pentru fiecare: 1 html + 1 schema):"
echo "Când alegem un personaj animator: $(echo "$HTML" | grep -o "Când alegem un personaj animator și când sunt necesare două personaje animatoare" | wc -l)"
echo "experiență excelentă: $(echo "$HTML" | grep -o "experiență excelentă" | wc -l)"
echo "1-3 ore: $(echo "$HTML" | grep -o "1-3 ore" | wc -l)"
echo "galeria respinsă (FUN FACTORY etc): $(echo "$HTML" | grep -o "FUN FACTORY" | wc -l)"

echo -e "\n--- POSITIVE CHECKS ---"
echo "hero nou prezent: $(echo "$HTML" | grep -o "Structura programului este adaptată în funcție de vârsta" | wc -l)"
echo "Activitățile sunt alese în funcție de vârsta copiilor: $(echo "$HTML" | grep -o "Activitățile sunt alese în funcție de vârsta copiilor" | wc -l)"
echo "Personaje animatoare și teme potrivite pentru copii: $(echo "$HTML" | grep -o "Personaje animatoare și teme potrivite pentru copii" | wc -l)"
echo "Cum alegi corect programul cu animatori: $(echo "$HTML" | grep -o "Cum alegi corect programul cu animatori" | wc -l)"
echo "link /personaje-animatori-copii-bucuresti/: $(echo "$HTML" | grep -o "/personaje-animatori-copii-bucuresti/" | wc -l)"

echo "FAQ Schema total (count of 'Question'): $(echo "$HTML" | grep -o '"@type": "Question"' | wc -l)"

echo -e "\n--- INTACT CHECKS ---"
echo "pricing 280: $(echo "$HTML" | grep -o "280 lei" | wc -l)"
echo "pricing 490: $(echo "$HTML" | grep -o "490 lei" | wc -l)"
echo "pricing 830: $(echo "$HTML" | grep -o "830 lei" | wc -l)"
echo "protected reviews/stars/Google badge: $(echo "$HTML" | grep -o "google-trust-badge" | wc -l)"
echo "canonical/robots OK: $(echo "$HTML" | grep -o 'rel="canonical" href="https://www.kassia.ro/animatori-petreceri-copii/"' | wc -l)"
