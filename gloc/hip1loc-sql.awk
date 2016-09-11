BEGIN {
   FS = ""
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO `hip1loc` (HIP, Plx, GLon, GLat, RA, DE, SpType, Vmag, BTmag, VTmag, BV, VI) VALUES ("

   # HIP
   hip = sprintf("%s%s%s%s%s%s", $41, $42, $43, $44, $45, $46)
   gsub(/ /, "", hip)
   printf "%s", hip

   # Plx
   plx = sprintf("%s%s%s%s%s%s%s", $54, $55, $56, $57, $58, $59, $60)
   gsub(/ /, "", plx)
   if (plx == "")
      printf ",null"
   else
      printf ",%s", plx

   # GLon
   glon = sprintf("%s%s%s%s%s%s%s%s", $1, $2, $3, $4, $5, $6, $7, $8)
   gsub(/ /, "", glon)
   if (glon == "")
      printf ",null"
   else
      printf ",%s", glon

   # GLat
   glat = sprintf("%s%s%s%s%s%s%s%s", $10, $11, $12, $13, $14, $15, $16, $17)
   gsub(/ /, "", glat)
   if (glat == "")
      printf ",null"
   else
      printf ",%s", glat

   # RA
   ra = sprintf("%s%s%s%s%s%s%s%s%s%s", $19, $20, $21, $22, $23, $24, $25, $26,
        $27, $28)
   gsub(/ /, "", ra)
   if (ra == "")
      printf ",null"
   else
      printf ",%s", ra

   # DE
   de = sprintf("%s%s%s%s%s%s%s%s%s%s", $30, $31, $32, $33, $34, $35, $36, $37,
        $38, $39)
   gsub(/ /, "", de)
   if (de == "")
      printf ",null"
   else
      printf ",%s", de

   # SpType - data may not exist
   sptype = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s", $89, $90, $91, $92, $93, $94,
            $95, $96, $97, $98, $99, $100)
   gsub(/^ +/, "", sptype)
   gsub(/ +$/, "", sptype)
   if (sptype == "")
      printf ",null" 
   else
      printf ",\"%s\"", sptype

   # Vmag
   vmag = sprintf("%s%s%s%s%s", $48, $49, $50, $51, $52)
   gsub(/ /, "", vmag)
   if (vmag == "")
      printf ",null"
   else
      printf ",%s", vmag

   # BTmag
   btmag = sprintf("%s%s%s%s%s%s", $62, $63, $64, $65, $66, $67)
   gsub(/ /, "", btmag)
   if (btmag == "")
      printf ",null"
   else
      printf ",%s", btmag

   # VTmag
   vtmag = sprintf("%s%s%s%s%s%s", $69, $70, $71, $72, $73, $74)
   gsub(/ /, "", vtmag)
   if (vtmag == "")
      printf ",null"
   else
      printf ",%s", vtmag

   # BV
   bv = sprintf("%s%s%s%s%s%s", $76, $77, $78, $79, $80, $81)
   gsub(/ /, "", bv)
   if (bv == "")
      printf ",null"
   else
      printf ",%s", bv

   # VI
   vi = sprintf("%s%s%s%s%s", $83, $84, $85, $86, $87)
   gsub(/ /, "", vi)
   if (vi == "")
      printf ",null"
   else
      printf ",%s", vi

   printf ");\n"
}
