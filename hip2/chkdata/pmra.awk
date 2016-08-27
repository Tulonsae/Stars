BEGIN {
   FS = " "
}

{
   # PMRA
   pmra = $8
   gsub(/ /, "", pmra)
   if (pmra == "")
      printf "null"
   else
      printf "%s", pmra

   printf "\n"
}
