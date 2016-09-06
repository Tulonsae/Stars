BEGIN {
   FS = "|"
   maxLen = 0
}

{
   # GName
   gname = $23
   gsub(/^ +/, "", gname)
   gsub(/ +$/, "", gname)
   if (gname == "")
      printf "null" 
   else
      printf "%s", gname

   printf "\n"

   len = length(gname)
   if (len > maxLen)
      maxLen = len
}

END {
   printf "INFO, max length is %d\n", maxLen
}
