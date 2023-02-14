require 'date'
require 'json'

class Report
  class << self
    def call(data)
      build_report(data)
    end

    private

    def build_report(data)
      raise NotImplementedError
    end

    def header
      "#{year} Report"
    end

    def year
      Date.today.year.to_s
    end
  end
end

class HtmlReport < Report
  def self.build_report(data)
    <<~HTML
      <!DOCTYPE html>
      <head><title>#{header}</title></head>
      <body>#{data}</body>
    HTML
  end
end

class JsonReport < Report
  def self.build_report(data)
    { title: header, data: data }.to_json
  end
end

class DocReport < Report
  def self.build_report(data)
    <<~DOC
      header: #{header}
      data: #{data}
    DOC
  end
end

data = 'This is data'

puts HtmlReport.call(data)
puts JsonReport.call(data)
puts DocReport.call(data)
