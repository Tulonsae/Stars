BEGIN {
   FS = "|"
   cntZero = 0
   cntNull = 0
   maxBefore = 0
   minBefore = 150
   maxAfter = 0
   minAfter = 150
}

{ 
   # Vmag
   vmag = $14
   gsub(/ /, "", vmag)
   if (vmag == "")
      printf "null"
   else     
      printf "%s", vmag

   printf "\n"

   # Get the number of decimal places
   before = vmag
   gsub(/\..*$/, "", before)
   gsub(/-/, "", before)
   lenBefore = length(before)
   if (lenBefore > maxBefore) {
      maxBefore = lenBefore
      vBefore = before
   }
   if (lenBefore < minBefore)
      minBefore = lenBefore
   after = vmag
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

   if (vmag == "")
      cntNull = cntNull + 1
   else {
      if (vmag == 0) cntZero = cntZero + 1
   }
}

END {
   if (cntNull > 0)
      printf "WARN, %d stars have vmag values of null\n", cntNull
   if (cntZero > 0)
      printf "WARN, %d stars have vmag values of zero\n", cntZero
   printf "INFO, max length of before decimal is %d (%s)\n", maxBefore, vBefore
   printf "INFO, min length of before decimal is %d\n", minBefore
   printf "INFO, max length of after decimal is %d (%s)\n", maxAfter, vAfter
   printf "INFO, min length of after decimal is %d\n", minAfter
}
