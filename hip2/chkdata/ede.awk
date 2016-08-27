BEGIN {
   FS = " "
}

{
   # eDE
   ede = $11
   gsub(/ /, "", ede)
   if (ede == "")
      printf "null"
   else
      printf "%s", ede

   printf "\n"
}
