BEGIN {
   FS = " "
}

{
   # DE
   de = $6
   gsub(/ /, "", de)
   if (de == "")
      printf "null"
   else
      printf "%s", de

   printf "\n"
}
