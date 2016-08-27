BEGIN {
   FS = " "
}

{
   # nFT
   nft = $15
   gsub(/ /, "", nft)
   if (nft == "")
      printf "null"
   else
      printf "%s", nft

   printf "\n"

   hip = $1

   if (length(nft) > 3)
      printf "WARN, bad nft (%s) found for hip %s\n", nft, hip
}
