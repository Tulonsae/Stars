BEGIN {
   FS = ""
}

{
   # MultID - data may not exist
   multid = sprintf("%s%s%s%s", $191, $192, $193, $194)
   if ((multid == "    ") || (multid == ""))
      printf "null" 
   else
      printf "\"%s\"", multid

   printf "\n"
}
