BEGIN {
   FS = ""
   printf "SET NAMES utf8;\n"
}

# Skips empty lines.
/^$/ {
   next
}

# Fixes a tab which should be a space.
/.*\t.*/ {
   gsub(/\t/, "    ")
}

{
   printf "INSERT INTO wgsn (Name, Desg, RA, Decl, Vmag, ID, Con, HIP, HD, HR, Approved) VALUES ("

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
   ra = sprintf("%s%s%s%s%s%s%s%s%s%s", $32, $33, $34, $35, $36, $37, $38, $39,
        $40, $41)
   gsub(/ /, "", ra)
   printf ",%s", ra

   # Decl
   decl = sprintf("%s%s%s%s%s%s%s%s%s%s", $44, $45, $46, $47, $48, $49, $50,
          $51, $52, $53)
   gsub(/ /, "", decl)
   printf ",%s", decl

   # Vmag
   vmag = sprintf("%s%s%s%s%s", $56, $57, $58, $59, $60)
   gsub(/ /, "", vmag)
   if (vmag == "-")
      printf ",null" 
   else
      printf ",%s", vmag

   # ID
   id = sprintf("%s%s%s%s%s", $64, $65, $66, $67, $68)
   gsub(/ /, "", id)
   if (id == "-")
      printf ",null" 
   else
      printf ",\"%s\"", id

   # Con
   con = sprintf("%s%s%s", $71, $72, $73)
   printf ",\"%s\"", con

   # HIP
   hip = sprintf("%s%s%s%s%s%s", $76, $77, $78, $79, $80, $81)
   gsub(/ /, "", hip)
   if (hip == "-")
      printf ",null" 
   else
      printf ",%s", hip

   # HD
   hd = sprintf("%s%s%s%s%s%s", $84, $85, $86, $87, $88, $89)
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
   approved = sprintf("%s%s%s%s%s%s%s%s%s%s", $92, $93, $94, $95, $96, $97,
              $98, $99, $100, $101)
   printf ",\'%s\'", approved

   printf ");\n"
}
