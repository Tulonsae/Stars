BEGIN {
   FS = " "
}

{
   # ePMDE
   epmde = $14
   gsub(/ /, "", epmde)
   if (epmde == "")
      printf "null"
   else
      printf "%s", epmde

   printf "\n"
}
