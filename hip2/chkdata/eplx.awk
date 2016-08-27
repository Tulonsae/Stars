BEGIN {
   FS = " "
}

{
   # ePlx
   eplx = $12
   gsub(/ /, "", eplx)
   if (eplx == "")
      printf "null"
   else
      printf "%s", eplx

   printf "\n"
}
