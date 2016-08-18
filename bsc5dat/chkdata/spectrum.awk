BEGIN {
   FS = ""
}

{
   # Spectrum
   spectrum = sprintf("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", $128, $129,
              $130, $131, $132, $133, $134, $135, $136, $137, $138, $139, $140,
              $141, $142, $143, $144, $145, $146, $147)
   gsub(/^ +/, "", spectrum)
   gsub(/ +$/, "", spectrum)
   if (spectrum == "")
      printf "null" 
   else
      printf "\"%s\"", spectrum

   # SpectrumCode - depends on Spectrum
   spectrumcode = $148
   if (spectrum == "")
      printf ",null" 
   else
      printf ",\'%s\'", spectrumcode

   printf "\n"

   hr = sprintf("%s%s%s%s", $1, $2, $3, $4)
   gsub(/ /, "", hr)

   if ((spectrum == "") && (spectrumcode != " "))
      printf "WARN, spectrumcode (%s) found when no spectrum for hr %s\n",
              spectrumcode, hr

   if (spectrum != "") {
      if ((spectrumcode != "e") && (spectrumcode != "v") && (spectrumcode != "t") && (spectrumcode != " "))
         printf "WARN, bad spectrumcode (%s) found\n", spectrumcode
   }
}
