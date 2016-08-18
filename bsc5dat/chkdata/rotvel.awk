BEGIN {
   FS = ""
}

{
   # RotVel - data may not exist
   rotvel = sprintf("%s%s%s", $177, $178, $179)
   gsub(/ /, "", rotvel)
   if (rotvel == "")
      printf "null"
   else
      printf "%s", rotvel

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

   printf "\n"

   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)

   if (rotvellim != "") {
      if ((rotvel == "") && (rotvellim != "")) {
         printf "WARN, rotvellim (%s) found when no rotvel for hr %s\n",
         rotvellim, hr
      }
   }

   if (rotvelflag != "") {
      if ((rotvel == "") && (rotvelflag != " ")) {
         printf "WARN, rotvelflag (%s) found when no rotvel for hr %s\n",
         rotvelflag, hr
      }
      if ((rotvelflag != ":") && (rotvelflag != "v") && (rotvelflag != " "))
         printf "WARN, bad rotvelflag (%s) found for hr %s\n", rotvelflag, hr
   }
}
