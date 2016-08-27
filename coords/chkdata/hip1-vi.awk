BEGIN {
   FS = ""
}

{
   # VI
   vi = sprintf("%s%s%s%s%s", $83, $84, $85, $86, $87)
   gsub(/ /, "", vi)
   if (vi == "")
      printf "null"
   else
      printf "%s", vi

   printf "\n"
}
