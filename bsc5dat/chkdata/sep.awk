BEGIN {
   FS = ""
}

{
   # Sep - data may not exist
   sep = sprintf("%s%s%s%s%s%s", $185, $186, $187, $188, $189, $190)
   gsub(/ /, "", sep)
   if (sep == "")
      printf "null"
   else
      printf "%s", sep

   printf "\n"
}
