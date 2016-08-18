BEGIN {
   FS = ""
}

{
   # DMId
   dmid = sprintf("%s%s%s%s%s%s%s%s%s%s%s", $15, $16, $17, $18, $19, $20, $21,
          $22, $23, $24, $25)
   if (dmid == "           ")
      printf "null" 
   else
      printf "\"%s\"", dmid

   printf "\n"
}
