#!/usr/bin/env ruby


puts "Nombre de carpeta padre"

padre = gets.chop
padre= padre + "/"
system 'mkdir', padre

asignaturas = ['fol','gtb','lnd','fuw','ingles','add']

asignaturas.each do |i|
  system 'mkdir', padre + i
end
