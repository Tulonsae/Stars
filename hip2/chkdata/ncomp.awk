BEGIN {
   FS = " "
}

{
   # nComp
   ncomp = $4
   gsub(/ /, "", ncomp)
   if (ncomp == "")
      printf "null"
   else
      printf "%s", ncomp

   printf "\n"

   hip = $1

   if (length(ncomp) > 1)
      printf "WARN, bad ncomp (%s) found for hip %s\n", ncomp, hip
}
