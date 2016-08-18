BEGIN {
   FS = ""
}

{
   # BV
   bv = sprintf("%s%s%s%s%s", $110, $111, $112, $113, $114)
   gsub(/ /, "", bv)
   if (bv == "")
      printf "null" 
   else
      printf "%s", bv

   # BVFlag - depends on BV
   bvflag = $115
   if (bv == "")
      printf ",null" 
   else
      printf ",\'%s\'", bvflag

   printf "\n"

   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)

   if ((bv == "") && (bvflag != " "))
      printf "WARN, bvflag (%s) found when no bv for hr %s\n", bvflag, hr

   if ((bvflag != ":") && (bvflag != "?") && (bvflag != " "))
      printf "WARN, bad bvflag found\n"
}
