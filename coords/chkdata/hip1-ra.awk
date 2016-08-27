BEGIN {
   FS = ""
}

{
   # RA
   ra = sprintf("%s%s%s%s%s%s%s%s%s%s", $19, $20, $21, $22, $23, $24, $25, $26,
        $27, $28)
   gsub(/ /, "", ra)
   if (ra == "")
      printf "null"
   else
      printf "%s", ra

   printf "\n"
}
