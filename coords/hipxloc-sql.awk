BEGIN {
   FS = "|"
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO `hipxloc` (HIP, GLon, GLat, RA, DE,Plx, Dist, X, Y, Z, SpType, Umag, Bmag, Vmag, BV, VI, UmagAbs, BmagAbs, VmagAbs, HD, Con, Name, GName) VALUES ("

   # HIP
   hip = $5
   gsub(/ /, "", hip)
   printf "%s", hip

   # GLon
   glon = $1
   gsub(/ /, "", glon)
   if (glon == "")
      printf ",null"
   else
      printf ",%s", glon

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

   # Plx
   plx = $6
   gsub(/ /, "", plx)
   if (plx == "")
      printf ",null"
   else
      printf ",%s", plx

   # Dist
   dist = $7
   gsub(/ /, "", dist)
   if (dist == "")
      printf ",null"
   else
      printf ",%s", dist

   # X
   x = $8
   gsub(/ /, "", x)
   if (x == "")
      printf ",null"
   else
      printf ",%s", x

   # Y
   y = $9
   gsub(/ /, "", y)
   if (y == "")
      printf ",null"
   else
      printf ",%s", y

   # Z
   z = $10
   gsub(/ /, "", z)
   if (z == "")
      printf ",null"
   else
      printf ",%s", z

   # SpType
   sptype = $11
   gsub(/^ +/, "", sptype)
   gsub(/ +$/, "", sptype)
   if (sptype == "")
      printf ",null" 
   else
      printf ",\"%s\"", sptype

   # Umag
   umag = $12
   gsub(/ /, "", umag)
   if (umag == "")
      printf ",null"
   else
      printf ",%s", umag

   # Bmag
   bmag = $13
   gsub(/ /, "", bmag)
   if (bmag == "")
      printf ",null"
   else
      printf ",%s", bmag

   # Vmag
   vmag = $14
   gsub(/ /, "", vmag)
   if (vmag == "")
      printf ",null"
   else
      printf ",%s", vmag

   # BV
   bv = $15
   gsub(/ /, "", bv)
   if (bv == "")
      printf ",null"
   else
      printf ",%s", bv

   # VI
   vi = $16
   gsub(/ /, "", vi)
   if (vi == "")
      printf ",null"
   else
      printf ",%s", vi

   # UmagAbs
   umagabs = $17
   gsub(/ /, "", umagabs)
   if (umagabs == "")
      printf ",null"
   else
      printf ",%s", umagabs

   # BmagAbs - data may not exist
   bmagabs = $18
   gsub(/ /, "", bmagabs)
   if (bmagabs == "")
      printf ",null"
   else
      printf ",%s", bmagabs

   # VmagAbs - data may not exist
   vmagabs = $19
   gsub(/ /, "", vmagabs)
   if (vmagabs == "")
      printf ",null"
   else
      printf ",%s", vmagabs

   # HD - data may not exist
   hd = $20
   gsub(/ /, "", hd)
   if (hd == "")
      printf ",null"
   else
      printf ",%s", hd

   # Con - data may not exist
   con = $21
   if ((con == "") || (con == "   "))
      printf ",null"
   else
      printf ",\"%s\"", con

   # Name - data may not exist
   name = $22
   gsub(/^ +/, "", name)
   gsub(/ +$/, "", name)
   if (name == "")
      printf ",null"
   else
      printf ",\"%s\"", name

   # GName - data may not exist
   gname = $22
   gsub(/^ +/, "", gname)
   gsub(/ +$/, "", gname)
   if (gname == "")
      printf ",null"
   else
      printf ",\"%s\"", gname

   printf ");\n"
}
