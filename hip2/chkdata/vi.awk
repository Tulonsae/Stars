BEGIN {
   FS = " "
   maxlen = 0
}

{
   # VI
   vi = $26
   gsub(/ /, "", vi)
   if (vi == "")
      printf "null"
   else
      printf "%s", vi

   printf "\n"

   gsub(/.*\./, "", vi)
   gsub(/0$/, "", vi)
   gsub(/0$/, "", vi)
   gsub(/0$/, "", vi)
   len = length(vi)
   if (len > maxlen)
      maxlen = len
}

END {
   printf "INFO: max length is %d\n", maxlen
}
