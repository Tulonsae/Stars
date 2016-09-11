BEGIN {
   FS = ""
}

{
   # VTmag
   vtmag = sprintf("%s%s%s%s%s%s", $69, $70, $71, $72, $73, $74)
   gsub(/ /, "", vtmag)
   if (vtmag == "")
      printf "null"
   else
      printf "%s", vtmag

   printf "\n"
}
