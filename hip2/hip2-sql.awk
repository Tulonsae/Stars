BEGIN {
   FS = " "
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO hip2 (HIP, Snew, Sold, nComp, RA, DE, Plx, PMRA, PMDE, eRA, eDE, ePlx, ePMRA, ePMDE, nFT, F2, F1, cda, catId, HPmag, eMag, sMag, VA, BV, eBV, VI, UW1, UW2, UW3, UW4, UW5, UW6, UW7, UW8, UW9, UW10, UW11, UW12, UW13, UW14, UW15) VALUES ("

   # HIP
   printf "%s", $1

   # Snew
   printf ",%s", $2

   # Sold
   printf ",%s", $3

   # nComp
   printf ",%s", $4

   # RA
   printf ",%s", $5

   # DE
   printf ",%s", $6

   # Plx
   printf ",%s", $7

   # PMRA
   printf ",%s", $8

   # PMDE
   printf ",%s", $9

   # eRA
   printf ",%s", $10

   # eDE
   printf ",%s", $11

   # ePlx
   printf ",%s", $12

   # ePMRA
   printf ",%s", $13

   # ePMDE
   printf ",%s", $14

   # nFT
   printf ",%s", $15

   # F2
   printf ",%s", $16

   # F1
   printf ",%s", $17

   # cda
   printf ",%s", $18

   # catId
   printf ",%s", $19

   # HPmag
   printf ",%s", $20

   # eMag
   printf ",%s", $21

   # sMag
   printf ",%s", $22

   # VA
   printf ",%s", $23

   # BV
   printf ",%s", $24

   # eBV
   printf ",%s", $25

   # VI
   printf ",%s", $26

   # UW1
   printf ",%s", $27

   # UW2
   printf ",%s", $28

   # UW3
   printf ",%s", $29

   # UW4
   printf ",%s", $30

   # UW5
   printf ",%s", $31

   # UW6
   printf ",%s", $32

   # UW7
   printf ",%s", $33

   # UW8
   printf ",%s", $34

   # UW9
   printf ",%s", $35

   # UW10
   printf ",%s", $36

   # UW11
   printf ",%s", $37

   # UW12
   printf ",%s", $38

   # UW13
   printf ",%s", $39

   # UW14
   printf ",%s", $40

   # UW15
   printf ",%s", $41

   printf ");\n"
}
