BEGIN {
   FS = ""
}

{
   # Dmag - data may not exist
   dmag = sprintf("%s%s%s%s", $181, $182, $183, $184)
   gsub(/ /, "", dmag)
   if (dmag == "")
      printf "null"
   else
      printf "%s", dmag

   printf "\n"
}
