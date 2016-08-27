BEGIN {
   FS = ""
   maxLen = 0
}

{
   # SpType - data may not exist
   sptype = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s", $89, $90, $91, $92, $93, $94,
            $95, $96, $97, $98, $99, $100)
   gsub(/^ +/, "", sptype)
   gsub(/ +$/, "", sptype)
   if (sptype == "")
      printf "null" 
   else
      printf "\"%s\"", sptype

   printf "\n"

   len = length(sptype)
   if (len > maxLen)
      maxLen = len
}

END {
   printf "INFO, max length is %d\n", maxLen
}
