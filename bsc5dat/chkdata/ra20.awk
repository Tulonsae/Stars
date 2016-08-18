BEGIN {
   FS = ""
}

{
   # RAh20
   rah20 = sprintf("%s%s", $76, $77)
   gsub(/ /, "", rah20)
   if (rah20 == "")
      printf "null" 
   else
      printf "%s", rah20

   # RAm20
   ram20 = sprintf("%s%s", $78, $79)
   gsub(/ /, "", ram20)
   if (ram20 == "")
      printf ",null" 
   else
      printf ",%s", ram20

   # RAs20
   ras20 = sprintf("%s%s%s%s", $80, $81, $82, $83)
   gsub(/ /, "", ras20)
   if (ras20 == "")
      printf ",null" 
   else
      printf ",%s", ras20

   printf "\n"
}
