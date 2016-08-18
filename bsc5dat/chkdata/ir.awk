BEGIN {
   FS = ""
}

{

   # IRFlag
   irflag = $42
   if (irflag == "I")
      printf "\'%s\'", irflag
   else if (irflag == " ")
      printf "null"
   else
      printf "WARN-%s", irflag

   # IRCode - depends on IRFlag
   ircode = $43
   if (irflag == "I")
      printf ",\'%s\'", ircode
   else if ((irflag == " ") && (ircode == " "))
      printf ",null" 
   else
      printf ",WARN-%s", ircode

   printf "\n"
}
