BEGIN {
   FS = ""
}

{
   # Plx - data may not exist
   plx = sprintf("%s%s%s%s%s", $162, $163, $164, $165, $166)
   gsub(/ /, "", plx)
   if (plx == "")
      printf "null" 
   else
      printf "%s", plx

   # PlxFlag - depends on Plx, data may not exist
   plxflag = $161
   if ((plx == "") || (plxflag == ""))
      printf ",null" 
   else
      printf ",\'%s\'", plxflag

   printf "\n"

   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)

   if (plxflag != "") {
      if ((plx == "") && (plxflag != " "))
         printf "WARN, plxflag (%s) found when no plx for hr %s\n", plxflag, hr
   }

   if (plx != "") {
      if ((plxflag != "D") && (plxflag != " "))
         printf "WARN, bad plxflag (%s) found\n", plxflag
   }
}
