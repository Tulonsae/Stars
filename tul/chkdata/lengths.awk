BEGIN {
   FS = ""
   maxLen = 0
   minLen = 150
   maxBefore = 0
   minBefore = 150
   maxAfter = 0
   minAfter = 150
}

{
   # Get number of columns
   data = $0
   len = length(data)
   if (len > maxLen)
      maxLen = len
   if (len < minLen)
      minLen = len

   # Get the number of decimal places
   before = $0
   gsub(/\..*$/, "", before)
   gsub(/-/, "", before)
   lenBefore = length(before)
   if (lenBefore > maxBefore) {
      maxBefore = lenBefore
      vBefore = before
   }
   if (lenBefore < minBefore)
      minBefore = lenBefore
   after = $0
   gsub(/^.*\./, ".", after)
   if (after < 1) {
      gsub(/\./, "", after)
      lenAfter = length(after)
      if (lenAfter > maxAfter) {
         maxAfter = lenAfter
         vAfter = after
      }
      if (lenAfter < minAfter)
         minAfter = lenAfter
   }
}

END {
   printf "INFO, max length is %d\n", maxLen
   printf "INFO, min length is %d\n", minLen
   printf "INFO, max length of before decimal is %d (%s)\n", maxBefore, vBefore
   printf "INFO, min length of before decimal is %d\n", minBefore
   printf "INFO, max length of after decimal is %d (%s)\n", maxAfter, vAfter
   printf "INFO, min length of after decimal is %d\n", minAfter
}
