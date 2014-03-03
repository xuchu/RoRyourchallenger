#!/usr/bin/ruby

require 'mysql2'

begin
    con = Mysql2::Client.new(:host => "localhost", :username => "root", :password=>"frouds",
        :database => "NewRoRyourchallenger", :socket => "/tmp/mysql.sock")
   
    text = File.open("states.csv", "r").read
    text.gsub!(/\r\n?/, "\n")     
    text.each_line do |line|
        ta = line.split(",")
        con.query("INSERT INTO states(id, state_name, country_id) VALUES('#{ta[0]}', '#{ta[1]}', '#{ta[2]}')")
    end
    
rescue Mysql2::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
