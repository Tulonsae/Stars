BEGIN {
   FS = ""
   maxLen = 0
   minLen = 150
}

{
   # Get the max columns
   data = $0
   len = length(data)
   if (len > maxLen)
      maxLen = len
   if (len < minLen)
      minLen = len
}

END {
   printf "INFO, max length is %d\n", maxLen
   printf "INFO, min length is %d\n", minLen
}
