require 'crack'
require 'open-uri'
require 'json'

class CCMenu

  def initialize(url)
    @data = Crack::XML.parse(open(url))['Projects']['Project']
  end

  def json
    @data.to_json
  end

  def status
    overall = 'Success'
    @data.each do |step|
      if step['lastBuildStatus'] != 'Success'
        overall = step['lastBuildStatus']
      end
    end
    return overall
  end
  def failed
    list = Array.new
    @data.each do |step|
      list << step['name'] if step['lastBuildStatus'] == 'Failure'
    end
    return list
  end

  def values
    steps = Hash.new({ value: 0 })
    @data.each do |step|
      name = step['name']
      status = step['lastBuildStatus']
      steps[name] =  { label: name, status: status}
    end
    return steps.values
  end

  def count
    @data.length
  end

  def color
    case status
      when 'Failure'   then 'red'
      when 'Exception' then 'orange'
      when 'Unknown'   then 'orange'
      else 'green'
    end
  end


  def data
    @data
  end

end
