BEGIN {
   FS = ""
}

{
   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)
   printf "%s", hr

   printf "\n"
}
