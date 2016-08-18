BEGIN {
   FS = ""
   printf "SET NAMES utf8;\n"
}

{
   printf "INSERT INTO bsc5dat (HR, BF, DMId, HD, SAO, FK5, IRFlag, IRCode, MultCode, ADS, ADSnc, VarID, RAh19, RAm19, RAs19, Declb19, Decld19, Declm19, Decls19, RAh20, RAm20, RAs20, Declb20, Decld20, Declm20, Decls20, GLong, GLat, Vmag, VmagCode, VmagFlag, BV, BVFlag, UB, UBFlag, RI, RICode, Spectrum, SpectrumCode, PMRA, PMDec, Plx, PlxFlag, RadVel, RadVelCom, RotVel, RotVelLim, RotVelFlag, Dmag, Sep, MultID, MultNum, NoteFlag) VALUES ("

   # HR
   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)
   printf "%s", hr

   # BF
   bf = sprintf("%s%s%s%s%s%s%s%s%s%s", $5, $6, $7, $8, $9, $10, $11, $12, $13,
        $14)
   if (bf == "          ")
      printf ",null" 
   else
      printf ",\"%s\"", bf

   # DMId
   dmid = sprintf("%s%s%s%s%s%s%s%s%s%s%s", $15, $16, $17, $18, $19, $20, $21,
          $22, $23, $24, $25)
   if (dmid == "           ")
      printf ",null" 
   else
      printf ",\"%s\"", dmid

   # HD
   hd = sprintf("%s%s%s%s%s%s", $26, $27, $28, $29, $30, $31)
   gsub(/ /, "", hd)
   if (hd == "")
      printf ",null" 
   else
      printf ",%s", hd

   # SAO
   sao = sprintf("%s%s%s%s%s%s", $32, $33, $34, $35, $36, $37)
   gsub(/ /, "", sao)
   if (sao == "")
      printf ",null" 
   else
      printf ",%s", sao

   # FK5
   fk5 = sprintf("%s%s%s%s", $38, $39, $40, $41)
   gsub(/ /, "", fk5)
   if (fk5 == "")
      printf ",null" 
   else
      printf ",%s", fk5

   # IRFlag
   irflag = $42
   if (irflag == "I")
      printf ",\'%s\'", irflag
   else
      printf ",null" 

   # IRCode - depends on IRFlag
   ircode = $43
   if (irflag == "I") {
      gsub(/'/, "''", ircode)
      printf ",\'%s\'", ircode
   } else
      printf ",null" 

   # MultCode
   multcode = $44
   if (multcode == " ")
      printf ",null" 
   else
      printf ",\'%s\'", multcode

   # ADS
   ads = sprintf("%s%s%s%s%s", $45, $46, $47, $48, $49)
   gsub(/ /, "", ads)
   if (ads == "")
      printf ",null" 
   else
      printf ",%s", ads

   # ADSnc
   adsnc = sprintf("%s%s", $50, $51)
   gsub(/ /, "", adsnc)
   if (adsnc == "")
      printf ",null" 
   else
      printf ",\"%s\"", adsnc

   # VarID
   varid = sprintf("%s%s%s%s%s%s%s%s%s", $52, $53, $54, $55, $56, $57, $58,
           $59, $60)
   if (varid == "         ")
      printf ",null" 
   else
      printf ",\"%s\"", varid

   # RAh19
   rah19 = sprintf("%s%s", $61, $62)
   gsub(/ /, "", rah19)
   if (rah19 == "")
      printf ",null" 
   else
      printf ",%s", rah19

   # RAm19
   ram19 = sprintf("%s%s", $63, $64)
   gsub(/ /, "", ram19)
   if (ram19 == "")
      printf ",null" 
   else
      printf ",%s", ram19

   # RAs19
   ras19 = sprintf("%s%s%s%s", $65, $66, $67, $68)
   gsub(/ /, "", ras19)
   if (ras19 == "")
      printf ",null" 
   else
      printf ",%s", ras19

   # Declb19
   declb19 = sprintf("%s", $69)
   gsub(/ /, "", declb19)
   if (declb19 == "")
      printf ",null" 
   else
      printf ",\'%s\'", declb19

   # Decld19
   decld19 = sprintf("%s%s", $70, $71)
   gsub(/ /, "", decld19)
   if (decld19 == "")
      printf ",null" 
   else
      printf ",%s", decld19

   # Declm19
   declm19 = sprintf("%s%s", $72, $73)
   gsub(/ /, "", declm19)
   if (declm19 == "")
      printf ",null" 
   else
      printf ",%s", declm19

   # Decls19
   decls19 = sprintf("%s%s", $74, $75)
   gsub(/ /, "", decls19)
   if (decls19 == "")
      printf ",null" 
   else
      printf ",%s", decls19

   # RAh20
   rah20 = sprintf("%s%s", $76, $77)
   gsub(/ /, "", rah20)
   if (rah20 == "")
      printf ",null" 
   else
      printf ",%s", rah20

   # RAm20
   ram20 = sprintf("%s%s", $78, $79)
   gsub(/ /, "", ram20)
   if (ram20 == "")
      printf ",null" 
   else
      printf ",%s", ram20

   # RAs20
   ras20 = sprintf("%s%s%s%s", $80, $81, $82, $83)
   gsub(/ /, "", ras20)
   if (ras20 == "")
      printf ",null" 
   else
      printf ",%s", ras20

   # Declb20
   declb20 = sprintf("%s", $84)
   gsub(/ /, "", declb20)
   if (declb20 == "")
      printf ",null" 
   else
      printf ",\'%s\'", declb20

   # Decld20
   decld20 = sprintf("%s%s", $85, $86)
   gsub(/ /, "", decld20)
   if (decld20 == "")
      printf ",null" 
   else
      printf ",%s", decld20

   # Declm20
   declm20 = sprintf("%s%s", $87, $88)
   gsub(/ /, "", declm20)
   if (declm20 == "")
      printf ",null" 
   else
      printf ",%s", declm20

   # Decls20
   decls20 = sprintf("%s%s", $89, $90)
   gsub(/ /, "", decls20)
   if (decls20 == "")
      printf ",null" 
   else
      printf ",%s", decls20

   # GLong
   glong = sprintf("%s%s%s%s%s%s", $91, $92, $93, $94, $95, $96)
   gsub(/ /, "", glong)
   if (glong == "")
      printf ",null" 
   else
      printf ",%s", glong

   # GLat
   glat = sprintf("%s%s%s%s%s%s", $97, $98, $99, $100, $101, $102)
   gsub(/ /, "", glat)
   if (glat == "")
      printf ",null" 
   else
      printf ",%s", glat

   # Vmag
   vmag = sprintf("%s%s%s%s%s", $103, $104, $105, $106, $107)
   gsub(/ /, "", vmag)
   if (vmag == "")
      printf ",null" 
   else
      printf ",%s", vmag

   # VmagCode - depends on Vmag
   if (vmag == "")
      printf ",null" 
   else
      printf ",\'%s\'", $108

   # VmagFlag - depends on Vmag
   if (vmag == "")
      printf ",null" 
   else
      printf ",\'%s\'", $109

   # BV
   bv = sprintf("%s%s%s%s%s", $110, $111, $112, $113, $114)
   gsub(/ /, "", bv)
   if (bv == "")
      printf ",null" 
   else
      printf ",%s", bv

   # BVFlag - depends on BV
   if (bv == "")
      printf ",null" 
   else
      printf ",\'%s\'", $115

   # UB
   ub = sprintf("%s%s%s%s%s", $116, $117, $118, $119, $120)
   gsub(/ /, "", ub)
   if (ub == "")
      printf ",null" 
   else
      printf ",%s", ub

   # UBFlag - depends on UB
   if (ub == "")
      printf ",null" 
   else
      printf ",\'%s\'", $121

   # RI
   ri = sprintf("%s%s%s%s%s", $122, $123, $124, $125, $126)
   gsub(/ /, "", ri)
   if (ri == "")
      printf ",null" 
   else
      printf ",%s", ri

   # RICode - depends on RI
   if (ri == "")
      printf ",null" 
   else
      printf ",\'%s\'", $127

   # Spectrum
   spectrum = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", $128, $129,
              $130, $131, $132, $133, $134, $135, $136, $137, $138, $139, $140,
              $141, $142, $143, $144, $145, $146, $147)
   gsub(/^ +/, "", spectrum)
   gsub(/ +$/, "", spectrum)
   if (spectrum == "")
      printf ",null" 
   else
      printf ",\"%s\"", spectrum

   # SpectrumCode - depends on Spectrum
   if (spectrum == "")
      printf ",null" 
   else
      printf ",\'%s\'", $148

   # PMRA
   pmra = sprintf("%s%s%s%s%s%s", $149, $150, $151, $152, $153, $154)
   gsub(/ /, "", pmra)
   if (pmra == "")
      printf ",null" 
   else
      printf ",%s", pmra

   # PMDec
   pmdec = sprintf("%s%s%s%s%s%s", $155, $156, $157, $158, $159, $160)
   gsub(/ /, "", pmdec)
   if (pmdec == "")
      printf ",null" 
   else
      printf ",%s", pmdec

   # Plx - data may not exist
   plx = sprintf("%s%s%s%s%s", $162, $163, $164, $165, $166)
   gsub(/ /, "", plx)
   if (plx == "")
      printf ",null"
   else
      printf ",%s", plx

   # PlxFlag - depends on Plx, data may not exist
   plxflag = $161
   if ((plx == "") || (plxflag == ""))
      printf ",null"
   else
      printf ",\'%s\'", plxflag

   # RadVel - data may not exist
   radvel = sprintf("%s%s%s%s", $167, $168, $169, $170)
   gsub(/ /, "", radvel)
   if (radvel == "")
      printf ",null"
   else
      printf ",%s", radvel

   # RadVelCom - data may not exist
   radvelcom = sprintf("%s%s%s%s", $171, $172, $173, $174)
   gsub(/ /, "", radvelcom)
   if (radvelcom == "")
      printf ",null"
   else
      printf ",\"%s\"", radvelcom

   # RotVel - data may not exist
   rotvel = sprintf("%s%s%s", $177, $178, $179)
   gsub(/ /, "", rotvel)
   if (rotvel == "")
      printf ",null"
   else
      printf ",%s", rotvel

   # RotVelLim - depends on RotVel, data may not exist
   rotvellim = sprintf("%s%s", $175, $176)
   gsub(/ /, "", rotvellim)
   if ((rotvel == "") || (rotvellim == ""))
      printf ",null"
   else
      printf ",\"%s\"", rotvellim

   # RotVelFlag - depends on RotVel, data may not exist
   rotvelflag = $180
   if ((rotvel == "") || (rotvelflag == ""))
      printf ",null"
   else
      printf ",\'%s\'", rotvelflag

   # Dmag - data may not exist
   dmag = sprintf("%s%s%s%s", $181, $182, $183, $184)
   gsub(/ /, "", dmag)
   if (dmag == "")
      printf ",null"
   else
      printf ",%s", dmag

   # Sep - data may not exist
   sep = sprintf("%s%s%s%s%s%s", $185, $186, $187, $188, $189, $190)
   gsub(/ /, "", sep)
   if (sep == "")
      printf ",null"
   else
      printf ",%s", sep

   # MultID - data may not exist
   multid = sprintf("%s%s%s%s", $191, $192, $193, $194)
   if ((multid == "    ") || (multid == ""))
      printf ",null" 
   else
      printf ",\"%s\"", multid

   # MultNum - data may not exist
   multcnt = sprintf("%s%s", $195, $196)
   gsub(/ /, "", multcnt)
   if (multcnt == "")
      printf ",null" 
   else
      printf ",%s", multcnt

   # NoteFlag - data may not exist

   printf ");\n"
}
