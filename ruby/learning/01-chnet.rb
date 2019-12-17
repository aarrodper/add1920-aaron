#!/usr/bin/env ruby

def menu
  puts "Selecciona una red:"
  puts "r) RESET"
  puts "1) aula109.static"
  puts "2) dhcp"
  puts "3) casa.static"
case gets.strip
when "1"
 puts "Ha seleccionado aula109.static"
when "2"
 puts "Ha seleccionado dhcp. Usted debe:"
 dynamic_network_conf
when "3"
 puts "Ha seleccionado casa.static. Usted debe:"
 home_static
when "r" , "R"
  puts "Reseteando..."
  reset
else
  puts "ERROR, opción desconocida."
end
end

def class109_static
  show = puts "system('ip addr add 172.19.42.31/16 dev eth0')"
return show
end

def dynamic_network_conf
  show = puts "system('dhclient eth0 -v')"
return show
end

def home_static
  show = puts "system('ip addr add 192.168.1.41/24 dev eth0')"
return show
end

def reset
  system('ifdown eth0')
  system('ifup eth0')
end

menu
