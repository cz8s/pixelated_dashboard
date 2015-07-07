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

  def data
    @data
  end

end
