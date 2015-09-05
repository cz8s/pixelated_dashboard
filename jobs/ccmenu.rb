require './lib/ccmenu'

SCHEDULER.every '60s', :first_in => 0 do |job|
    go = CCMenu.new '/home/chris/cctray.xml' 
    send_event('go', {text:go.failed})
    send_event('go', {color: go.color})
end

SCHEDULER.every '60s', :first_in => 0 do |job|
    snap = CCMenu.new 'https://snap-ci.com/pixelated/pixelated-user-agent/branch/master/cctray.xml'
    send_event('snap_ua', {text:snap.failed})
    send_event('snap_ua', {color: snap.color})
end
SCHEDULER.every '60s', :first_in => 0 do |job|
    snap = CCMenu.new 'https://snap-ci.com/pixelated/leap_mail/branch/develop/cctray.xml'
    send_event('snap_leap_mail', {text:snap.failed})
    send_event('snap_leap_mail', {color: snap.color})
end
SCHEDULER.every '60s', :first_in => 0 do |job|
    snap = CCMenu.new 'https://snap-ci.com/pixelated/soledad/branch/develop/cctray.xml' 
    send_event('snap_soledad', {text:snap.failed})
    send_event('snap_soledad', {color: snap.color})
end

