BEGIN {
   FS = ""
}

{
   # HIP
   hip = sprintf("%s%s%s%s%s%s", $41, $42, $43, $44, $45, $46)
   gsub(/ /, "", hip)
   if (hip == "")
      printf "null"
   else
      printf "%s", hip

   printf "\n"
}
