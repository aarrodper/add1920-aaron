#!/usr/bin/env ruby




def help
  print '''Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creacion.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:

        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove'''
  puts ""
end

def version
  puts "Aarón Rodríguez Pérez"
  puts "18.12.20"
end

def status
  filename = ARGV[1]
  file = File.read(filename)
  file_lines = file.split("\n")
    file_lines.each do |line|
      split_line = line.split(":")
      status = `whereis #{split_line[0]} |grep bin |wc -l`.to_i
        if status == 0
          puts "#{split_line[0]} -> (U) uninstalled"
        elsif status == 1
          puts "#{split_line[0]} -> (I) installed"
        end
    end
end

def run
filename = ARGV[1]
  file = File.read(filename)
  file_lines = file.split("\n")
    file_lines.each do |line|
      split_line = line.split(":")
    end
  if Process.uid == 0 #Sí Root
    status = `whereis #{split_line[0]} |grep bin |wc -l`.to_i
    action = "#{split_line[1]}".to_s
      if action == "install"
        if status == 0
          `apt-get install -y #{split_line[0]}`
          puts "#{split_line[0]} installed"
        elsif status == 1
          puts "#{split_line[0]} already installed"
        end
      elsif action == "remove"
        if status == 0
          puts "#{split_line[0]} is not installed"
        elsif status == 1
          `apt-get remove -y #{split_line[0]}`
          puts "#{split_line[1]} uninstalled"
        end
      end
  else                #No Root 
	puts "ERROR : You must be ROOT!"
	exit 1         
  end
end

def menu
  option = ARGV[0] 
  if option == "--help"
    help
  elsif option == "--version"
    version
  elsif option == "--status"
    status
  elsif option == "--run"
    run
  else
    puts 'unknown command, try --help'
  end
end

menu

