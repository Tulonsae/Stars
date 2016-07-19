BEGIN {
   FS = ","
}

{
   printf "INSERT INTO hygxyz (ID, HIP, HD, HR, Gliese, BF, Name, RA, Decl, Distance, PMRA, PMDec, RV, Mag, AbsMag, Spectrum, BV, X, Y, Z, VX, VY, VZ) VALUES ("

   # ID
   printf "%s", $1

   if ($2 == "") # HIP
      printf ",null" 
   else
      printf ",%s", $2

   if ($3 == "") # HD
      printf ",null" 
   else
      printf ",%s", $3

   if ($4 == "") # HR
      printf ",null" 
   else
      printf ",%s", $4

   if ($5 == "") # Gliese
      printf ",null" 
   else
      printf ",\"%s\"", $5

   if ($6 == "") # BF
      printf ",null" 
   else
      printf ",\"%s\"", $6

   if ($7 == "") # Name
      printf ",null" 
   else
      printf ",\"%s\"", $7

   if ($8 == "") # RA
      printf ",null" 
   else
      printf ",%s", $8

   if ($9 == "") # Decl
      printf ",null" 
   else
      printf ",%s", $9

   if ($10 == "") # Distance
      printf ",null" 
   else
      printf ",%s", $10

   if ($11 == "") # PMRA
      printf ",null" 
   else
      printf ",%s", $11

   if ($12 == "") # PMDec
      printf ",null" 
   else
      printf ",%s", $12

   if ($13 == "") # RV
      printf ",null" 
   else
      printf ",%s", $13

   if ($14 == "") # Mag
      printf ",null" 
   else
      printf ",%s", $14

   if ($15 == "") # AbsMag
      printf ",null" 
   else
      printf ",%s", $15

   if ($16 == "") # Spectrum
      printf ",null" 
   else
      printf ",\"%s\"", $16

   if ($17 == "") # BV
      printf ",null" 
   else
      printf ",%s", $17

   if ($18 == "") # X
      printf ",null" 
   else
      printf ",%s", $18

   if ($19 == "") # Y
      printf ",null" 
   else
      printf ",%s", $19

   if ($20 == "") # Z
      printf ",null" 
   else
      printf ",%s", $20

   if ($21 == "") # VX
      printf ",null" 
   else
      printf ",%s", $21

   if ($22 == "") # VY
      printf ",null" 
   else
      printf ",%s", $22

   if ($23 == "") # VZ
      printf ",null" 
   else
      printf ",%s", $23

   printf ");\n"
}
