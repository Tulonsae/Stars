BEGIN {
   FS = ""
}

{
   # GLong
   glong = sprintf("%s%s%s%s%s%s", $91, $92, $93, $94, $95, $96)
   gsub(/ /, "", glong)
   if (glong == "")
      printf "null" 
   else
      printf "%s", glong

   # GLat
   glat = sprintf("%s%s%s%s%s%s", $97, $98, $99, $100, $101, $102)
   gsub(/ /, "", glat)
   if (glat == "")
      printf ",null" 
   else
      printf ",%s", glat

   printf "\n"
}
