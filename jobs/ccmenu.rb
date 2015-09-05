require './lib/ccmenu'

SCHEDULER.every '3s', :first_in => 0 do |job|
    go = CCMenu.new '/home/chris/cctray.xml' 
    send_event('go_count', {current:go.count})
    send_event('go_failed', {text:go.failed})
    send_event('go_numfailed', {current:go.failed.length})
end

SCHEDULER.every '3s', :first_in => 0 do |job|
    snap = CCMenu.new '/home/chris/work/cctray.xml' 
    send_event('snap_count', {current:snap.count})
    send_event('snap_failed', {text:snap.failed})
    send_event('snap_numfailed', {current:snap.failed.length})
end

