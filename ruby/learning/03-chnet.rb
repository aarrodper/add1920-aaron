#!/usr/bin/env ruby

def menu
while true
  puts "Selecciona una acción:"
  puts " ( R ) RESET"
  puts " ( 1 ) aula109.static"
  puts " ( 2 ) casa.static"
  puts " ( E ) SALIR"
case gets.strip
when "1"
 puts "Ha seleccionado aula109.static"
 class109_static
when "2"
 puts "Ha seleccionado casa.static"
 home_static
when "r" , "R"
  puts "Reseteando..."
  reset
when "e" , "E"
  puts "Saliendo..."
  break
else
  puts "ERROR, opción desconocida."
  break
end
end
end

def reset
  system('ifdown eth0')
  system('ifup eth0')
end
