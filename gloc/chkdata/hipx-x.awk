BEGIN {
   FS = "|"
   cntZero = 0
   cntNull = 0
}

{ 
   # X
   x = $8
   gsub(/ /, "", x)
   if (x == "")
      printf "null"
   else     
      printf "%s", x

   printf "\n"

   if (x == "")
      cntNull = cntNull + 1
   else {
      if (x == 0) cntZero = cntZero + 1
   }
}

END {
   if (cntNull > 0)
      printf "WARN, %d stars have x values of null\n", cntNull
   if (cntZero > 0)
      printf "WARN, %d stars have x values of zero\n", cntZero
}
