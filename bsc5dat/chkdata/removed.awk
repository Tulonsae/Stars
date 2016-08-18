BEGIN {
   FS = ""
}

{
   # HR
   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)

   # RAh19
   rah19 = sprintf("%s%s", $61, $62)
   gsub(/ /, "", rah19)

   # RAm19
   ram19 = sprintf("%s%s", $63, $64)
   gsub(/ /, "", ram19)

   # RAs19
   ras19 = sprintf("%s%s%s%s", $65, $66, $67, $68)
   gsub(/ /, "", ras19)

   # RAh20
   rah20 = sprintf("%s%s", $76, $77)
   gsub(/ /, "", rah20)

   # RAm20
   ram20 = sprintf("%s%s", $78, $79)
   gsub(/ /, "", ram20)

   # RAs20
   ras20 = sprintf("%s%s%s%s", $80, $81, $82, $83)
   gsub(/ /, "", ras20)

   # Declb19
   declb19 = sprintf("%s", $69)
   gsub(/ /, "", declb19)

   # Decld19
   decld19 = sprintf("%s%s", $70, $71)
   gsub(/ /, "", decld19)

   # Declm19
   declm19 = sprintf("%s%s", $72, $73)
   gsub(/ /, "", declm19)

   # Decls19
   decls19 = sprintf("%s%s", $74, $75)
   gsub(/ /, "", decls19)

   # Declb20
   declb20 = sprintf("%s", $84)
   gsub(/ /, "", declb20)

   # Decld20
   decld20 = sprintf("%s%s", $85, $86)
   gsub(/ /, "", decld20)

   # Declm20
   declm20 = sprintf("%s%s", $87, $88)
   gsub(/ /, "", declm20)

   # Decls20
   decls20 = sprintf("%s%s", $89, $90)
   gsub(/ /, "", decls20)

   # GLong
   glong = sprintf("%s%s%s%s%s%s", $91, $92, $93, $94, $95, $96)
   gsub(/ /, "", glong)

   # GLat
   glat = sprintf("%s%s%s%s%s%s", $97, $98, $99, $100, $101, $102)
   gsub(/ /, "", glat)

   # Vmag
   vmag = sprintf("%s%s%s%s%s", $103, $104, $105, $106, $107)
   gsub(/ /, "", vmag)

   if ((rah19 == "") && (ram19 == "") && (ras19 == "") && (rah20 == "") && (ram20 == "") && (ras20 == "") && (declb19 == "") && (decld19 == "") && (declm19 == "") && (decls19 == "") && (declb20 == "") && (decld20 == "") && (declm20 == "") && (decls20 == "") && (glong == "") && (glat == "") && (vmag == ""))

   printf "%s\n", hr
}
