BEGIN {
   FS = " "
}

{
   # PMDE
   pmde = $9
   gsub(/ /, "", pmde)
   if (pmde == "")
      printf "null"
   else
      printf "%s", pmde

   printf "\n"
}
