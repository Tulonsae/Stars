BEGIN {
   FS = ""
}

{
   # Vmag
   vmag = sprintf("%s%s%s%s%s", $103, $104, $105, $106, $107)
   gsub(/ /, "", vmag)
   if (vmag == "")
      printf "null" 
   else
      printf "%s", vmag

   # VmagCode - depends on Vmag
   vmagcode = $108
   if (vmag == "")
      printf ",null" 
   else
      printf ",\'%s\'", vmagcode

   # VmagFlag - depends on Vmag
   vmagflag = $109
   if (vmag == "")
      printf ",null" 
   else
      printf ",\'%s\'", vmagflag

   printf "\n"

   if ((vmagcode != "H") && (vmagcode != "R") && (vmagcode != " "))
      printf "WARN, bad vmagcode found\n"

   if ((vmagflag != ":") && (vmagflag != "?") && (vmagflag != " "))
      printf "WARN, bad vmagflag found\n"

   if (vmag != null) {
      vmagtest = vmag
      gsub(/[-.]/, "", vmagtest)
      if (length(vmagtest) > 3)
         printf "WARN, vmag %s has more than 3 significant digits\n", vmag
   }

}
