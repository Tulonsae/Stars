BEGIN {
   FS = "|"
}

{
   # Con - data may not exist
   con = $21
   if ((con == "") || (con == "   "))
      printf "null"
   else
      printf "%s", con

   printf "\n"
}
