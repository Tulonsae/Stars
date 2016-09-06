BEGIN {
   FS = "|"
   cntZero = 0
   cntNull = 0
}

{ 
   # Z
   z = $10
   gsub(/ /, "", z)
   if (z == "")
      printf "null"
   else     
      printf "%s", z

   printf "\n"

   if (z == "")
      cntNull = cntNull + 1
   else {
      if (z == 0) cntZero = cntZero + 1
   }
}

END {
   if (cntNull > 0)
      printf "WARN, %d stars have z values of null\n", cntNull
   if (cntZero > 0)
      printf "WARN, %d stars have z values of zero\n", cntZero
}
