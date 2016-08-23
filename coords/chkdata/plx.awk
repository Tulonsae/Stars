BEGIN {
   FS = ""
}

{
   # Plx
   plx = sprintf("%s%s%s%s%s%s%s", $48, $49, $50, $51, $52, $53, $54)
   gsub(/ /, "", plx)
   if (plx == "")
      printf "null"
   else
      printf "%s", plx

   printf "\n"
}
