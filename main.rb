#!/usr/bin/env ruby

$: << '.'

begin
  require 'rubygems'
  require 'uri'
  require 'net/http'
  require 'sanitize'
  require 'lib/application.rb'
  require 'getoptlong'
rescue LoadError => e
  puts e.inspect
end

ip =''

def usage()
puts "ruby main.rb --ip <ipaddress>"
end


if ARGV.length == 0
   usage()
   exit(1)
end



opts = GetoptLong.new(
["--ip", GetoptLong::OPTIONAL_ARGUMENT]
)


begin 
     opts.each do |opt, arg|
       
       case opt
          when '--ip'
           ip = arg
          end
       end

rescue
   usage()
   exit(1)
end
 
exit(1) if ip == ''

object = Application.new(ip)

location = object.request
