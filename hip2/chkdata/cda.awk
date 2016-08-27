BEGIN {
   FS = " "
}

{
   # cda
   cda = $18
   gsub(/ /, "", cda)
   if (cda == "")
      printf "null"
   else
      printf "%s", cda

   printf "\n"
}
