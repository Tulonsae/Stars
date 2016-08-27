BEGIN {
   FS = " "
}

{
   # catId
   catid = $19
   gsub(/ /, "", catid)
   if (catid == "")
      printf "null"
   else
      printf "%s", catid

   printf "\n"

   hip = $1

   if (length(catid) > 4)
      printf "WARN, bad catid (%s) found for hip %s\n", catid, hip
}
