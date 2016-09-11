BEGIN {
   FS = ""
}

{
   # DE
   de = sprintf("%s%s%s%s%s%s%s%s%s%s", $30, $31, $32, $33, $34, $35, $36, $37,
        $38, $39)
   gsub(/ /, "", de)
   if (de == "")
      printf "null"
   else
      printf "%s", de

   printf "\n"
}
