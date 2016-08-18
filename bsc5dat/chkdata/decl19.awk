BEGIN {
   FS = ""
}

{
   # Declb19
   declb19 = sprintf("%s", $69)
   gsub(/ /, "", declb19)
   if (declb19 == "")
      printf "null" 
   else
      printf "\'%s\'", declb19

   # Decld19
   decld19 = sprintf("%s%s", $70, $71)
   gsub(/ /, "", decld19)
   if (decld19 == "")
      printf ",null" 
   else
      printf ",%s", decld19

   # Declm19
   declm19 = sprintf("%s%s", $72, $73)
   gsub(/ /, "", declm19)
   if (declm19 == "")
      printf ",null" 
   else
      printf ",%s", declm19

   # Decls19
   decls19 = sprintf("%s%s", $74, $75)
   gsub(/ /, "", decls19)
   if (decls19 == "")
      printf ",null" 
   else
      printf ",%s", decls19

   printf "\n"

   if ((declb19 != "+") && (declb19 != "-") && (declb19 != ""))
      printf "WARN, bad sign character found\n"
}
