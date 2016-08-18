BEGIN {
   FS = ""
   cnt = 0
}

{
   # HIP
   hip = sprintf("%s%s%s%s%s%s", $9, $10, $11, $12, $13, $14)
   gsub(/ /, "", hip)
   printf "%s", hip

   # HD
   hd = sprintf("%s%s%s%s%s%s", $391, $392, $393, $394, $395, $396)
   gsub(/ /, "", hd)
   if (hd == "")
      printf ",null"
   else
      printf ",%s", hd

   printf "\n"

   cnt = cnt + 1
   if (hip == "")
      printf "WARN, hip id not found for record %d\n", cnt
}
