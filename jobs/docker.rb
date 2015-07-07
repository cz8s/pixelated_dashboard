require './lib/ccmenu'

SCHEDULER.every '5m', :first_in => 0 do |job|
  begin
    a = CCMenu.new '/home/chris/cctray.xml' 
    send_event('docker-build-go', a.json)
  end
end

