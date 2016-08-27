BEGIN {
   FS = " "
   cntNeg = 0
   cntZero = 0
}

{
   # Plx
   plx = $7
   printf "%s\n", plx

   if (plx == "0.00") cntZero = cntZero + 1
   if (plx < 0) cntNeg = cntNeg + 1
}

END {
   if (cntZero > 0)
      printf "WARN, %d stars have plx values of zero\n", cntZero
   if (cntNeg > 0)
      printf "WARN, %d stars have plx values less than zero\n", cntNeg
}
