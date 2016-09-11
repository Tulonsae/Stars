BEGIN {
   FS = ""
}

{
   # GLon
   glon = sprintf("%s%s%s%s%s%s%s%s", $1, $2, $3, $4, $5, $6, $7, $8)
   gsub(/ /, "", glon)
   if (glon == "")
      printf "null"
   else
      printf "%s", glon

   printf "\n"
}
