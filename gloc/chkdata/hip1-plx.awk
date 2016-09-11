BEGIN {
   FS = ""
   cntNeg = 0
   cntZero = 0
   cntNull = 0
}

{
   # Plx
   plx = sprintf("%s%s%s%s%s%s%s", $54, $55, $56, $57, $58, $59, $60)
   gsub(/ /, "", plx)
   if (plx == "")
      printf "null"
   else
      printf "%s", plx

   printf "\n"

   if (plx == "")
      cntNull = cntNull + 1
   else {
      if (plx == "0.00") cntZero = cntZero + 1
      if (plx < 0) cntNeg = cntNeg + 1
   }
}

END {
   if (cntNull > 0)
      printf "WARN, %d stars have plx values of null\n", cntNull
   if (cntZero > 0)
      printf "WARN, %d stars have plx values of zero\n", cntZero
   if (cntNeg > 0)
      printf "WARN, %d stars have plx values less than zero\n", cntNeg
}
