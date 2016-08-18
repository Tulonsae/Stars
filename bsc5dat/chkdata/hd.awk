BEGIN {
   FS = ""
}

{
   # HD
   hd = sprintf("%s%s%s%s%s%s", $26, $27, $28, $29, $30, $31)
   gsub(/ /, "", hd)
   if (hd == "")
      printf "null" 
   else
      printf "%s", hd

   printf "\n"
}
