#!/usr/bin/env ruby


puts "Nombre de carpeta padre a borrar:"

padre = gets.chop
system "rm -r /home/asir/Documentos/ADD/ruby/#{padre}"
