BEGIN {
   FS = "|"
   maxLen = 0
}

{
   # SpType
   sptype = sprintf("%s", $4)
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
