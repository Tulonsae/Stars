BEGIN {
   FS = "|"
   maxLen = 0
}

{
   # SpType
   sptype = $7
   gsub(/^ +/, "", sptype)
   gsub(/ +$/, "", sptype)
   if (sptype == "")
      printf "null" 
   else
      printf "%s", sptype

   printf "\n"

   len = length(sptype)
   if (len > maxLen) {
      maxLen = len
      value = sptype
   }
}

END {
   printf "INFO, max length is %d (%s)\n", maxLen, value
}
