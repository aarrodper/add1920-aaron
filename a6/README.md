#!/usr/bin/env ruby

def help #Mostrar la ayuda
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

def get_version #Mostrar el nombre y la fecha de creación
  puts "Aarón Rodríguez Pérez"
  puts "08.01.2020"
end

def get_status #Mostrar el estado de los programas (instalados o no)
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

def run #Ejecutar
  if Process.uid == 0 #Root
    filename = ARGV[1]
    file = File.read(filename)
    file_lines = file.split("\n")
    file_lines.each do |line|
      split_line = line.split(":")
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
      end
  else #No Root 
	puts "ERROR : You must be ROOT!"
	exit 1
  end
end

def show_menu #Menú de opciones
  option = ARGV[0] 
  if option == "--help"
    help
  elsif option == "--version"
    get_version
  elsif option == "--status"
    get_status
  elsif option == "--run"
    run
  else
    puts 'unknown command, try --help'
  end
end

show_menu
