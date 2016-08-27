BEGIN {
   FS = " "
}

{
   # F1
   f1 = $17
   gsub(/ /, "", f1)
   if (f1 == "")
      printf "null"
   else
      printf "%s", f1

   printf "\n"

   hip = $1

   if (length(f1) > 2)
      printf "WARN, bad f1 (%s) found for hip %s\n", f1, hip
}
