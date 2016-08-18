BEGIN {
   FS = ""
   minHr = ""
   minLength = 200
}

{
   # Check to make sure that all records have all the fields.
   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)
   
   num = NF
   if (num < 197) {
      if (num < minLength) {
         minLength = num
         minHr = hr
      }
      printf "hr %s missing data, record length is %d\n", hr, num
   }
}

END {
   printf "hr %s has least record length at %d\n", minHr, minLength
}
