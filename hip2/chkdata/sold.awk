BEGIN {
   FS = " "
}

{
   # Sold
   sold = $3
   gsub(/ /, "", sold)
   if (sold == "")
      printf "null"
   else
      printf "%s", sold

   printf "\n"
}
