BEGIN {
   FS = "|"
   cntZero = 0
   cntNull = 0
}

{ 
   # Y
   y = $9
   gsub(/ /, "", y)
   if (y == "")
      printf "null"
   else     
      printf "%s", y

   printf "\n"

   if (y == "")
      cntNull = cntNull + 1
   else {
      if (y == 0) cntZero = cntZero + 1
   }
}

END {
   if (cntNull > 0)
      printf "WARN, %d stars have y values of null\n", cntNull
   if (cntZero > 0)
      printf "WARN, %d stars have y values of zero\n", cntZero
}
