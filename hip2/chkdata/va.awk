BEGIN {
   FS = " "
}

{
   # VA
   va = $23
   gsub(/ /, "", va)
   if (va == "")
      printf "null"
   else
      printf "%s", va

   printf "\n"

   hip = $1

   if (length(va) > 1)
      printf "WARN, bad va (%s) found for hip %s\n", va, hip
}
