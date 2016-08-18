BEGIN {
   FS = ""
}

{
   # UB
   ub = sprintf("%s%s%s%s%s", $116, $117, $118, $119, $120)
   gsub(/ /, "", ub)
   if (ub == "")
      printf "null" 
   else
      printf "%s", ub

   # UBFlag - depends on UB
   ubflag = $121
   if (ub == "")
      printf ",null" 
   else
      printf ",\'%s\'", ubflag

   printf "\n"

   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)

   if ((ub == "") && (ubflag != " "))
      printf "WARN, ubflag (%s) found when no ub for hr %s\n", ubflag, hr

   if ((ubflag != ":") && (ubflag != "?") && (ubflag != " "))
      printf "WARN, bad ubflag found\n"
}
