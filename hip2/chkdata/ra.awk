BEGIN {
   FS = " "
}

{
   # RA
   ra = $5
   gsub(/ /, "", ra)
   if (ra == "")
      printf "null"
   else
      printf "%s", ra

   printf "\n"
}
