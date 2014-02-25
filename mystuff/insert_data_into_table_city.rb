#!/usr/bin/ruby

require 'mysql2'

begin
    con = Mysql2::Client.new(:host => "localhost", :username => "root", :password=>"frouds",
        :database => "RoRyourchallenger", :socket => "/tmp/mysql.sock")
   
    state = {}
    text = File.open("states.csv", "r").read
    text.gsub!(/\r\n?/, "\n")     
    text.each_line do |line|
        ta = line.split(",")
        #ta[0] is state id, ta[1] is state_name
        state[ta[0]] = ta[1]
        #con.query("INSERT INTO states(id, state_name, country_id) VALUES('#{ta[0]}', '#{ta[1]}', '#{ta[2]}')")
    end

    city = []
    text = File.open("US.csv", "r").read
    text.gsub!(/\r\n?/, "\n")     
    text.each_line do |line|
        ca = line.split(",")
        #ca[2] is state name
        state_id = state.key( ca[2] )
        if( state_id == nil)
            state_id = 0
        end
        city.push( ca[1] + "_" + state_id.to_s )
    end
    city.uniq!

    city.each{|c|
        cn = c.split("_")
        key = cn[0]
        value = cn[1]
        con.query("INSERT INTO cities(city_name, state_id) VALUES('#{key}', '#{value}')")
    }
    
rescue Mysql2::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end