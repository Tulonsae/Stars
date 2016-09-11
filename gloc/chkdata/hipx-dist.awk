BEGIN {
   FS = "|"
   cntNeg = 0
   cntZero = 0
   cntNull = 0
}

{ 
   # Dist
   dist = $7
   gsub(/ /, "", dist)
   if (dist == "")
      printf "null"
   else     
      printf "%s", dist

   printf "\n"

   if (dist == "")
      cntNull = cntNull + 1
   else {
      if (dist == 0) cntZero = cntZero + 1
      if (dist < 0) cntNeg = cntNeg + 1
   }
}

END {
   if (cntNull > 0)
      printf "WARN, %d stars have dist values of null\n", cntNull
   if (cntZero > 0)
      printf "WARN, %d stars have dist values of zero\n", cntZero
   if (cntNeg > 0)
      printf "WARN, %d stars have dist values less than zero\n", cntNeg
}
