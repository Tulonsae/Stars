BEGIN {
   FS = ""
}

{
   # GLat
   glat = sprintf("%s%s%s%s%s%s%s%s", $10, $11, $12, $13, $14, $15, $16, $17)
   gsub(/ /, "", glat)
   if (glat == "")
      printf "null"
   else
      printf "%s", glat

   printf "\n"
}
