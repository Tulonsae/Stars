BEGIN {
   FS = ""
}

{
   # ADS
   ads = sprintf("%s%s%s%s%s", $45, $46, $47, $48, $49)
   gsub(/ /, "", ads)
   if (ads == "")
      printf "null" 
   else
      printf "%s", ads

   printf "\n"
}
