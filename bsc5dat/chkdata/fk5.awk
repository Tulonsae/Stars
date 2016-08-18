BEGIN {
   FS = ""
}

{
   # FK5
   fk5 = sprintf("%s%s%s%s", $38, $39, $40, $41)
   gsub(/ /, "", fk5)
   if (fk5 == "")
      printf "null" 
   else
      printf "%s", fk5

   printf "\n"
}
