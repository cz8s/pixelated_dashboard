require 'nokogiri'
require 'open-uri'

steps = Hash.new({ value: 0 })

SCHEDULER.every '5m', :first_in => 0 do |job|
  begin
    snap_xml = Nokogiri::XML(open("https://snap-ci.com/pixelated-project/pixelated-user-agent/branch/master/cctray.xml"))
    snap_xml.xpath('//Project').each do |p|
      name = p.attribute('name').value.split(' ').last
      status = p.attribute('lastBuildStatus')
      activity = p.attribute('activity')
      steps[name] =  { label: name, value: status}
    end
    send_event('user-agent', { items: steps.values })
  end
end

