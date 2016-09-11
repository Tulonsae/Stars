BEGIN {
   FS = "|"
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO `bmkloc` (GLon, GLat, RA, DE, Name, MKflag, SpType) VALUES ("

   # GLon
   glon = $1
   gsub(/ /, "", glon)
   if (glon == "")
      printf "null"
   else
      printf "%s", glon

   # GLat
   glat = $2
   gsub(/ /, "", glat)
   if (glat == "")
      printf ",null"
   else
      printf ",%s", glat

   # RA
   ra = $3
   gsub(/ /, "", ra)
   if (ra == "")
      printf ",null"
   else
      printf ",%s", ra

   # DE
   de = $4
   gsub(/ /, "", de)
   if (de == "")
      printf ",null"
   else
      printf ",%s", de

   # Name
   name = $5
   gsub(/^ +/, "", name)
   gsub(/ +$/, "", name)
   if (name == "")
      printf ",null"
   else
      printf ",\"%s\"", name

   # MKflag
   con = $6
   if (con == " ")
      printf ",null"
   else
      printf ",\"%s\"", con

   # SpType - data may not exist
   sptype = $7
   gsub(/^ +/, "", sptype)
   gsub(/ +$/, "", sptype)
   if (sptype == "")
      printf ",null" 
   else
      printf ",\"%s\"", sptype

   printf ");\n"
}
