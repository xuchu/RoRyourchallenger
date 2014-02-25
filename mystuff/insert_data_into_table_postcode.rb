#!/usr/bin/ruby

require 'mysql2'

begin
    con = Mysql2::Client.new(:host => "localhost", :username => "root", :password=>"frouds",
        :database => "RoRyourchallenger", :socket => "/tmp/mysql.sock")
   
    state = {}
    text = File.open("US.csv", "r").read
    text.gsub!(/\r\n?/, "\n")     
    text.each_line do |line|
        ta = line.split(",")
        postcode = ta[0]
        city = ta[1]
        puts "postcode is " + postcode
        puts city
        rs = con.query "SELECT * FROM cities WHERE city_name = '#{city}'"

        result = rs.first
        city_id = result["id"]
        con.query("INSERT INTO postcodes(code, city_id) VALUES('#{postcode}', '#{city_id}')")
    end

    
    #con.query("INSERT INTO cities(city_name, state_id) VALUES('#{key}', '#{value}')")
    
    
rescue Mysql2::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end