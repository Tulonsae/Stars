BEGIN {
   FS = ""
}

{
   # SAO
   sao = sprintf("%s%s%s%s%s%s", $32, $33, $34, $35, $36, $37)
   gsub(/ /, "", sao)
   if (sao == "")
      printf "null" 
   else
      printf "%s", sao

   printf "\n"
}
