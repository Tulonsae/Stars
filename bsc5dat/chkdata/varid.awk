BEGIN {
   FS = ""
}

{
   # VarID
   varid = sprintf("%s%s%s%s%s%s%s%s%s", $52, $53, $54, $55, $56, $57, $58,
           $59, $60)
   if (varid == "         ")
      printf "null" 
   else
      printf "\"%s\"", varid

   printf "\n"
}
