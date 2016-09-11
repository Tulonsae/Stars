BEGIN {
   FS = ""
}

{
   # BV
   bv = sprintf("%s%s%s%s%s%s", $76, $77, $78, $79, $80, $81)
   gsub(/ /, "", bv)
   if (bv == "")
      printf "null"
   else
      printf "%s", bv

   printf "\n"
}
