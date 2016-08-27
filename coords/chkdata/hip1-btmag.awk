BEGIN {
   FS = ""
}

{
   # BTmag
   btmag = sprintf("%s%s%s%s%s%s", $62, $63, $64, $65, $66, $67)
   gsub(/ /, "", btmag)
   if (btmag == "")
      printf "null"
   else
      printf "%s", btmag

   printf "\n"
}
