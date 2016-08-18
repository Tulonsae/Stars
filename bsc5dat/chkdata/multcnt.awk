BEGIN {
   FS = ""
}

{
   # MultNum - data may not exist
   multcnt = sprintf("%s%s", $195, $196)
   gsub(/ /, "", multcnt)
   if (multcnt == "")
      printf "null" 
   else
      printf "%s", multcnt

   printf "\n"
}
