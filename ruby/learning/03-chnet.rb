#!/usr/bin/env ruby

def menu
while true
  puts "CHOOSE AN OPTION, PLEASE:"
  puts " ( S ) SHOW CURRENT"
  puts " ( R ) RESET"
  puts " ( 1 ) aula109.static"
  puts " ( 2 ) casa.static"
  puts " ( E ) EXIT"
case gets.strip
when "s", "S"
  system('more /etc/sysconfig/network/ifcfg-eth0')
when "r" , "R"
  puts "Resetting..."
  reset
when "1"
 puts "You chose aula109.static"
 class109_static
when "2"
 puts "You chose casa.static"
 home_static
when "e" , "E"
  puts "Exit... Bye!"
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

def class109_static
  system('sudo cp /home/aaron/net_config/home_static /etc/sysconfig/network/ifcfg-eth0')
  reset
end

def home_static
  system('sudo cp /home/aaron/net_config/class109_static /etc/sysconfig/network/ifcfg-eth0')
  reset 
end

menu
