BEGIN {
   FS = ""
}

{
   # RadVel - data may not exist
   radvel = sprintf("%s%s%s%s", $167, $168, $169, $170)
   gsub(/ /, "", radvel)
   if (radvel == "")
      printf "null"
   else
      printf "%s", radvel

   # RadVelCom - data may not exist
   radvelcom = sprintf("%s%s%s%s", $171, $172, $173, $174)
   gsub(/ /, "", radvelcom)
   if (radvelcom == "")
      printf ",null"
   else
      printf ",\"%s\"", radvelcom

   printf "\n"

   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)

   if (radvelcom != "") {
      if ((radvel == "") && (radvelcom != "")) {
         printf "WARN, radvelcom (%s) found when no radvel for hr %s\n",
         radvelcom, hr
      }
   }
}
