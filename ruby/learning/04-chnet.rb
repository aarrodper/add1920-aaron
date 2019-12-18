#!/usr/bin/env ruby

def menu
  while true
    puts "\n****************************"
    puts "  CHOOSE AN OPTION, PLEASE"
    puts "****************************"
    puts " ( R ) RESET"
    puts " ( 1 ) aula109.static"
    puts " ( 2 ) casa.static"
    puts " ( E ) EXIT\n\n"
  case gets.strip
    when "r" , "R"
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
      puts "ERROR, unknown option."
      break
    end
  end
end

def reset
  puts "Resetting... please wait"
  `ifdown eth0`
  `ifup eth0`
  puts "Reset completed"
end

def class109_static
  system('sudo cp /home/aaron/net_config/class109-static /etc/sysconfig/network/ifcfg-eth0')
  reset
  puts "Network configuration completed"
end

def home_static
  system('sudo cp /home/aaron/net_config/home_static /etc/sysconfig/network/ifcfg-eth0')
  reset
  puts "Network configuration completed"
end

menu
