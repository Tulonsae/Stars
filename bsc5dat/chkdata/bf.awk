BEGIN {
   FS = ""
}

{
   # BF
   bf = sprintf("%s%s%s%s%s%s%s%s%s%s", $5, $6, $7, $8, $9, $10, $11, $12, $13,
        $14)
   if (bf == "          ")
      printf "null" 
   else
      printf "\"%s\"", bf

   printf "\n"
}
