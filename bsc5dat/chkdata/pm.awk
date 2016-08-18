BEGIN {
   FS = ""
}

{
   # PMRA
   pmra = sprintf("%s%s%s%s%s%s", $149, $150, $151, $152, $153, $154)
   gsub(/ /, "", pmra)
   if (pmra == "")
      printf "null" 
   else
      printf "%s", pmra

   # PMDec
   pmdec = sprintf("%s%s%s%s%s%s", $155, $156, $157, $158, $159, $160)
   gsub(/ /, "", pmdec)
   if (pmdec == "")
      printf ",null" 
   else
      printf ",%s", pmdec

   printf "\n"
}
