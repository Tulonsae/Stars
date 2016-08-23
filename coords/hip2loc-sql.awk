BEGIN {
   FS = ""
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO `hip2loc` (HIP, Plx, GLon, GLat, RA, DE) VALUES ("

   # HIP
   hip = sprintf("%s%s%s%s%s%s", $41, $42, $43, $44, $45, $46)
   gsub(/ /, "", hip)
   printf "%s", hip

   # Plx
   plx = sprintf("%s%s%s%s%s%s%s", $48, $49, $50, $51, $52, $53, $54)
   gsub(/ /, "", plx)
   printf ",%s", plx

   # GLon
   glon = sprintf("%s%s%s%s%s%s%s%s", $1, $2, $3, $4, $5, $6, $7, $8)
   gsub(/ /, "", glon)
   printf ",%s", glon

   # GLat
   glat = sprintf("%s%s%s%s%s%s%s%s", $10, $11, $12, $13, $14, $15, $16, $17)
   gsub(/ /, "", glat)
   printf ",%s", glat

   # RA
   ra = sprintf("%s%s%s%s%s%s%s%s%s%s", $19, $20, $21, $22, $23, $24, $25, $26,
        $27, $28)
   gsub(/ /, "", ra)
   printf ",%s", ra

   # DE
   de = sprintf("%s%s%s%s%s%s%s%s%s%s", $30, $31, $32, $33, $34, $35, $36, $37,
        $38, $39)
   gsub(/ /, "", de)
   printf ",%s", de

   printf ");\n"
}
