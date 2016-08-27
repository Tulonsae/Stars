BEGIN {
   FS = " "
}

{
   # ePMRA
   epmra = $13
   gsub(/ /, "", epmra)
   if (epmra == "")
      printf "null"
   else
      printf "%s", epmra

   printf "\n"
}
