#!/usr/bin/env ruby


okey = system ("mkdir -p curso1920/{idp,lnd,fuw}")

if okey == true
  puts "Successful :)" #sería ideal eliminarlo y que no muestre nada
else
  puts "error :("
  exit 1 #código de error
end
