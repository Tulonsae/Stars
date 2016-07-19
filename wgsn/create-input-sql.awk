BEGIN {
   FS = " "
}

{
   printf "INSERT INTO wgsn (Name, Desg, RA, Decl, Approved, Vmag, ID, Con, HIP, HD, HR) VALUES ("

   # ID
   printf "\"%s\"", $1

   # Desg
   printf ",\"%s %s\"", $2, $3

   # RA
   printf ",%s", $4

   # Decl
   printf ",%s", $5

   # Approved
   printf ",STR_TO_DATE('%s','%%m/%%d/%%y')", $6

   if ($7 == "-") # Vmag
      printf ",null" 
   else
      printf ",%s", $7

   if ($8 == "-") # ID
      printf ",null" 
   else
      printf ",\"%s\"", $8

   if ($9 == "-") # Con
      printf ",null" 
   else
      printf ",\"%s\"", $9

   if ($10 == "-") # HIP
      printf ",null" 
   else
      printf ",%s", $10

   if ($11 == "-") # HD
      printf ",null" 
   else
      printf ",%s", $11

   if ($2 == "HR") # HR
      printf ",%s", $3
   else
      printf ",null" 

   printf ");\n"
}
