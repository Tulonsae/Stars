BEGIN {
   FS = ""
}

{
   # RI
   ri = sprintf("%s%s%s%s%s", $122, $123, $124, $125, $126)
   gsub(/ /, "", ri)
   if (ri == "")
      printf "null" 
   else
      printf "%s", ri

   # RICode - depends on RI
   ricode = $127
   if (ri == "")
      printf ",null" 
   else
      printf ",\'%s\'", ricode

   printf "\n"

   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)

   if ((ri == "") && (ricode != " "))
      printf "WARN, ricode (%s) found when no ri for hr %s\n", ricode, hr

   if (ri != "") {
      if ((ricode != "C") && (ricode != "E") && (ricode != ":") && (ricode != "?") && (ricode != "D") && (ricode != " "))
         printf "WARN, bad ricode (%s) found\n", ricode
   }
}
