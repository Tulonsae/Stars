BEGIN {
   FS = "|"
   maxLen = 0
}

{
   # Name
   name = $22
   gsub(/^ +/, "", name)
   gsub(/ +$/, "", name)
   if (name == "")
      printf "null" 
   else
      printf "%s", name

   printf "\n"

   len = length(name)
   if (len > maxLen)
      maxLen = len
}

END {
   printf "INFO, max length is %d\n", maxLen
}
