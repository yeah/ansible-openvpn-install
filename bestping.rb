#!/usr/bin/env ruby

INVENTORY_REGEX = /^(?<name>[^\s]+).*?ansible_host=(?<host>[^\s]+)/
PING_REGEX      = /min\/avg\/max\/stddev\s+=\s+\d+\.\d+\/(?<response_time>\d+\.\d+)\//

fastest = {}

File.open('production', 'r').each do |line|
  if server = line.match(INVENTORY_REGEX)
    print "Pinging #{server['name']}... "
    if ping = `ping -q -t 1 -i 0.1 #{server['host']}`.match(PING_REGEX)
      response_time = ping['response_time'].to_f
      color = if response_time < 50; 32; elsif response_time < 150; 33; else; 31; end
      if fastest['response_time'].nil? or response_time < fastest['response_time']
        fastest['name'] = server['name']
        fastest['response_time'] = response_time
        fastest['color'] = color
      end
      puts "\e[#{color}m#{ping['response_time']}ms\e[0m"
    else
      puts "\e[1m\e[#{31}mTimed out!\e[0m\e[22m"
    end
  end
end

puts "\e[1m#{fastest['name']}\e[22m has the best ping with \e[#{fastest['color']}m#{fastest['response_time']}ms\e[0m."
