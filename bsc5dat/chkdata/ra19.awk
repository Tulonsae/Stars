BEGIN {
   FS = ""
}

{
   # RAh19
   rah19 = sprintf("%s%s", $61, $62)
   gsub(/ /, "", rah19)
   if (rah19 == "")
      printf "null" 
   else
      printf "%s", rah19

   # RAm19
   ram19 = sprintf("%s%s", $63, $64)
   gsub(/ /, "", ram19)
   if (ram19 == "")
      printf ",null" 
   else
      printf ",%s", ram19

   # RAs19
   ras19 = sprintf("%s%s%s%s", $65, $66, $67, $68)
   gsub(/ /, "", ras19)
   if (ras19 == "")
      printf ",null" 
   else
      printf ",%s", ras19

   printf "\n"
}
