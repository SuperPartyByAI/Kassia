urls=(
  "https://www.kassia.ro/animatori-petreceri-copii-voluntari/"
  "https://www.kassia.ro/animatori-petreceri-copii-voluntari"
  "https://www.kassia.ro/animatori-copii-voluntari/"
  "https://www.kassia.ro/animatori-copii-voluntari"
  "https://www.kassia.ro/animatori-petreceri-copii-voluntari-ilfov/"
  "https://www.kassia.ro/animatori-copii-voluntari-ilfov/"
)

echo "--- URL INVENTORY LIVE ---"
for url in "${urls[@]}"; do
  echo "Checking: $url"
  curl -s -o /dev/null -w "HTTP_CODE: %{http_code}\nREDIRECT_URL: %{redirect_url}\n" "$url"
done
