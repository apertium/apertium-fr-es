echo "==French->Spanish===========================";
sh inconsistency.sh fra-spa > /tmp/fra-spa.testvoc; sh inconsistency-summary.sh /tmp/fra-spa.testvoc fra-spa
echo ""
echo "==Spanish->French===========================";
sh inconsistency.sh spa-fra > /tmp/spa-fra.testvoc; sh inconsistency-summary.sh /tmp/spa-fra.testvoc spa-fra
