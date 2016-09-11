BEGIN {
   FS = "|"
   cntZero = 0
   cntNull = 0
   maxBefore = 0
   minBefore = 95
   maxAfter = 0
   minAfter = 95
}

{
   # DE
   de = $4
   gsub(/ /, "", de)
   if (de == "")
      printf "null"
   else
      printf "%s", de

   printf "\n"

   # Get the number of decimal places
   before = de
   gsub(/\..*$/, "", before)
   gsub(/\+/, "", before)
   gsub(/-/, "", before)
   lenBefore = length(before)
   if (lenBefore > maxBefore) {
      maxBefore = lenBefore
      vBefore = before
   }
   if (lenBefore < minBefore)
      minBefore = lenBefore
   after = de
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

   if (de == "")
      cntNull = cntNull + 1
   else {
      if (de == 0) cntZero = cntZero + 1
   }
}

END {
   if (cntNull > 0)
      printf "WARN, %d stars have de values of null\n", cntNull
   if (cntZero > 0)
      printf "WARN, %d stars have de values of zero\n", cntZero
   printf "INFO, max length of before decimal is %d (%s)\n", maxBefore, vBefore
   printf "INFO, min length of before decimal is %d\n", minBefore
   printf "INFO, max length of after decimal is %d (%s)\n", maxAfter, vAfter
   printf "INFO, min length of after decimal is %d\n", minAfter
}
