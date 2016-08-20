BEGIN {
   FS = ""
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO `hipTOhd` (HIP, HD) VALUES ("

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

   printf ");\n"
}
