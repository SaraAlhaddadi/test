require_relative './base_response.rb'
class HtmlResponse < BaseResponse
  def content_type!
    @response.headers = @response.headers.merge('Content-Type' => 'text/html')
  end
end