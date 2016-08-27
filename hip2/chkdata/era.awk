BEGIN {
   FS = " "
}

{
   # eRA
   era = $10
   gsub(/ /, "", era)
   if (era == "")
      printf "null"
   else
      printf "%s", era

   printf "\n"
}
