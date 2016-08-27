BEGIN {
   FS = ""
}

{
   # Vmag
   vmag = sprintf("%s%s%s%s%s", $48, $49, $50, $51, $52)
   gsub(/ /, "", vmag)
   if (vmag == "")
      printf "null"
   else
      printf "%s", vmag

   printf "\n"
}
