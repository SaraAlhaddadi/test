require 'date'
require 'json'

class Report
  class << self
    def call(data, format: nil)
      case format
      when :html
        <<~HTML
          <!DOCTYPE html>
          <head><title>#{header}</title></head>
          <body>#{data}</body>
        HTML
      when :json
        { title: header, data: data }.to_json
      else
        <<~DOC
          header: #{header}
          data: #{data}
        DOC
      end
    end

    private

    def header
      "#{year} Report"
    end

    def year
      Date.today.year.to_s
    end
  end
end

data = 'This is data'

puts Report.call(data, format: :html)
puts Report.call(data, format: :json)
puts Report.call(data)
