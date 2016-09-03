BEGIN {
   FS = "|"
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO `hipxids` (`HIP`, `GLon`, `GLat`, `Con`, `SpType`, `HD`) VALUES ("

   # HIP
   hip = sprintf("%s", $3)
   gsub(/ /, "", hip)
   printf "%s", hip

   # GLon
   glon = sprintf("%s", $1)
   gsub(/ /, "", glon)
   printf ",%s", glon

   # GLat
   glat = sprintf("%s", $2)
   gsub(/ /, "", glat)
   printf ",%s", glat

   # Con
   con = sprintf("%s", $6)
   gsub(/ /, "", con)
   printf ",\"%s\"", con

   # SpType
   sptype = sprintf("%s", $4)
   gsub(/ +$/, "", sptype)
   if (sptype == "")
      printf ",null"
   else
      printf ",\"%s\"", sptype

   # HD
   hd = sprintf("%s", $5)
   gsub(/ /, "", hd)
   if (hd == "")
      printf ",null"
   else
      printf ",%s", hd

   printf ");\n"
}
