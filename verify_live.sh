#!/bin/bash
URL="https://www.kassia.ro/animatori-petreceri-copii/"
HTML=$(curl -s "$URL")

echo "--- NEGATIVE CHECKS ---"
echo "experiență excelentă: $(echo "$HTML" | grep -o "experiență excelentă" | wc -l)"
echo "Activități tematice și divertisment interactiv urmat imediat de Zone acoperite: $(echo "$HTML" | grep -A 1 "Activități tematice și divertisment interactiv" | grep -o "Zone acoperite" | wc -l)"
echo "1-3 ore: $(echo "$HTML" | grep -o "1-3 ore" | wc -l)"
echo "pictură pe față: $(echo "$HTML" | grep -o "pictură pe fața" | wc -l)"

echo -e "\n--- POSITIVE CHECKS ---"
echo "Structura programului este adaptată în funcție de vârsta copiilor: $(echo "$HTML" | grep -o "Structura programului este adaptată în funcție de vârsta copiilor" | wc -l)"
echo "Activitățile sunt alese în funcție de vârsta copiilor: $(echo "$HTML" | grep -o "Activitățile sunt alese în funcție de vârsta copiilor" | wc -l)"
echo "Personaje animatoare și teme potrivite pentru copii: $(echo "$HTML" | grep -o "Personaje animatoare și teme potrivite pentru copii" | wc -l)"
echo "Cum alegi corect programul cu animatori: $(echo "$HTML" | grep -o "Cum alegi corect programul cu animatori" | wc -l)"
echo "Când alegem un personaj animator și când sunt necesare două personaje animatoare?: $(echo "$HTML" | grep -o "Când alegem un personaj animator și când sunt necesare două personaje animatoare" | wc -l)"
echo "Ce program este potrivit pentru o petrecere la apartament?: $(echo "$HTML" | grep -o "Ce program este potrivit pentru o petrecere la apartament" | wc -l)"
echo "Cum se adaptează jocurile la restaurant sau terasă?: $(echo "$HTML" | grep -o "Cum se adaptează jocurile la restaurant sau terasă" | wc -l)"
echo "Cum alegem personajul în funcție de vârsta copilului?: $(echo "$HTML" | grep -o "Cum alegem personajul în funcție de vârsta copilului" | wc -l)"
echo "Citește mai jos câteva recenzii primite de la clienți: $(echo "$HTML" | grep -o "Citește mai jos câteva recenzii primite de la clienți" | wc -l)"

echo -e "\n--- INTACT CHECKS ---"
echo "280 lei: $(echo "$HTML" | grep -o "280 lei" | wc -l)"
echo "490 lei: $(echo "$HTML" | grep -o "490 lei" | wc -l)"
echo "830 lei: $(echo "$HTML" | grep -o "830 lei" | wc -l)"
echo "google-trust-badge: $(echo "$HTML" | grep -o "google-trust-badge" | wc -l)"
echo "FAQ Schema (FAQPage): $(echo "$HTML" | grep -o "FAQPage" | wc -l)"
echo "Canonical: $(echo "$HTML" | grep -o 'rel="canonical" href="https://www.kassia.ro/animatori-petreceri-copii/"' | wc -l)"
