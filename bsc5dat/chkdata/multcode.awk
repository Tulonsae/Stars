BEGIN {
   FS = ""
}

{
   # MultCode
   multcode = $44
   if (multcode == " ")
      printf "null" 
   else
      printf "\'%s\'", multcode

   printf "\n"

   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)
   ads = sprintf("%s%s%s%s%s", $45, $46, $47, $48, $49)
   gsub(/ /, "", ads)
   adsnc = sprintf("%s%s", $50, $51)
   gsub(/ /, "", adsnc)

   if (multcode == " ") {
      if (ads != "")
         printf "WARN - %s has no Multiple, but has ADS\n", hr
      if (adsnc != "")
         printf "WARN - %s has no Multiple, but has ADScomp\n", hr
   }

   if (ads == "") {
      if (multcode != " ")
         printf "WARN - %s has no ADS, but has Multiple\n", hr
      if (adsnc != "")
         printf "WARN - %s has no ADS, but has ADScomp\n", hr
   }

   if (adsnc == "") {
      if (multcode != " ")
         printf "WARN - %s has no ADSComp, but has Multiple\n", hr
      if (ads != "")
         printf "WARN - %s has no ADSComp, but has ADS\n", hr
   }
}
