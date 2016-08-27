BEGIN {
   FS = ""
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO wgsn (Name, Desg, RA, DE, VMag, BFid, BFnum, Con, HIP, HD, HR, Approved) VALUES ("

   # Name
   name = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", $1, $2, $3, $4, $5, $6,
          $7, $8, $9, $10, $11, $12, $13, $14, $15, $16)
   gsub(/  /, "", name)
   gsub(/ $/, "", name)
   printf "\"%s\"", name

   # Desg
   desg = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s", $18, $19, $20, $21, $22, $23,
          $24, $25, $26, $27, $28, $29, $30)
   gsub(/  /, "", desg)
   gsub(/ $/, "", desg)
   printf ",\"%s\"", desg
   split(desg, desgId, " ");

   # RA
   ra = sprintf("%s%s%s%s%s%s%s%s%s%s", $33, $34, $35, $36, $37, $38, $39,
        $40, $41, $42)
   gsub(/ /, "", ra)
   printf ",%s", ra

   # DE
   de = sprintf("%s%s%s%s%s%s%s%s%s%s", $44, $45, $46, $47, $48, $49, $50,
        $51, $52, $53)
   gsub(/ /, "", de)
   printf ",%s", de

   # Vmag
   vmag = sprintf("%s%s%s%s%s", $56, $57, $58, $59, $60)
   gsub(/ /, "", vmag)
   if (vmag == "-")
      printf ",null" 
   else
      printf ",%s", vmag

   # BFid
   bfid = sprintf("%s%s%s%s%s", $62, $63, $64, $65, $66)
   gsub(/ /, "", bfid)
   if (bfid == "-")
      printf ",null" 
   else
      printf ",\"%s\"", bfid

   # BFnum
   bfnum = sprintf("%s", $72)
   printf ",\"%s\"", bfnum

   # Con
   con = sprintf("%s%s%s", $68, $69, $70)
   printf ",\"%s\"", con

   # HIP
   hip = sprintf("%s%s%s%s%s%s", $74, $75, $76, $77, $78, $79)
   gsub(/ /, "", hip)
   if (hip == "-")
      printf ",null" 
   else
      printf ",%s", hip

   # HD
   hd = sprintf("%s%s%s%s%s%s", $81, $82, $83, $84, $85, $86)
   gsub(/ /, "", hd)
   if (hd == "-")
      printf ",null" 
   else
      printf ",%s", hd

   # HR
   if (desgId[1] == "HR")
      printf ",%s", desgId[2]
   else
      printf ",null" 

   # Approved
   approved = sprintf("%s%s%s%s%s%s%s%s%s%s", $88, $89, $90, $91, $92, $93,
              $94, $95, $96, $97)
   printf ",\'%s\'", approved

   printf ");\n"
}
