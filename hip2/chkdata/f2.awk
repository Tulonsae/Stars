BEGIN {
   FS = " "
}

{
   # F2
   f2 = $16
   gsub(/ /, "", f2)
   if (f2 == "")
      printf "null"
   else
      printf "%s", f2

   printf "\n"
}
