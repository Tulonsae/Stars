BEGIN {
   FS = "	"
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO cdstars (Name, Meaning, AltNames, Desg, HR, HD, RA, Decl, V, BV, Spectrum, Comments) VALUES ("

   # Name
   printf "\"%s\"", $1

   if ($2 == "") # Meaning
      printf ",null" 
   else
      printf ",\"%s\"", $2

   if ($3 == "") # OtherNames
      printf ",null" 
   else
      printf ",\"%s\"", $3

   # OtherNames
   printf ",\"%s\"", $4

   # HR
   printf ",%s", $5

   # HD
   printf ",%s", $6

   # RA
   printf ",\"%s\"", $7

   # Dec
   printf ",\"%s\"", $8

   # V
   printf ",%s", $9

   if ($10 == "") # B-V
      printf ",null" 
   else
      printf ",%s", $10

   if ($11 == "") # Spectrum
      printf ",null" 
   else
      printf ",\"%s\"", $11

   if ($12 == "") # Comments
      printf ",null" 
   else
      printf ",\"%s\"", $12

   printf ");\n"
}
