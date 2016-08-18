BEGIN {
   FS = ""
}

{
   # ADSnc
   adsnc = sprintf("%s%s", $50, $51)
   gsub(/ /, "", adsnc)
   if (adsnc == "")
      printf "null" 
   else
      printf "\"%s\"", adsnc

   printf "\n"
}
