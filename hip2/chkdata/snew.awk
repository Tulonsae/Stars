BEGIN {
   FS = " "
}

{
   # Snew
   snew = $2
   gsub(/ /, "", snew)
   if (snew == "")
      printf "null"
   else
      printf "%s", snew

   printf "\n"
}
