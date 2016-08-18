BEGIN {
   FS = ""
}

{
   # Declb20
   declb20 = sprintf("%s", $84)
   gsub(/ /, "", declb20)
   if (declb20 == "")
      printf ",null" 
   else
      printf ",\'%s\'", declb20

   # Decld20
   decld20 = sprintf("%s%s", $85, $86)
   gsub(/ /, "", decld20)
   if (decld20 == "")
      printf ",null" 
   else
      printf ",%s", decld20

   # Declm20
   declm20 = sprintf("%s%s", $87, $88)
   gsub(/ /, "", declm20)
   if (declm20 == "")
      printf ",null" 
   else
      printf ",%s", declm20

   # Decls20
   decls20 = sprintf("%s%s", $89, $90)
   gsub(/ /, "", decls20)
   if (decls20 == "")
      printf ",null" 
   else
      printf ",%s", decls20

   printf "\n"

   if ((declb20 != "+") && (declb20 != "-") && (declb20 != ""))
      printf "WARN, bad sign character found\n"
}
