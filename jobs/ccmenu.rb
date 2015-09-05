require './lib/ccmenu'

SCHEDULER.every '3s', :first_in => 0 do |job|
    a = CCMenu.new '/home/chris/cctray.xml' 
    send_event('count', {current:a.count})
    send_event('failed', {text:a.failed})
    send_event('numfailed', {current:a.failed.length})
end

