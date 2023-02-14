require_relative './html_response.rb'
require_relative './json_response.rb'

class BaseController
  def initialize(params:)
    @params = params
  end

  def build(name)
    raise "#{name} ??! I can not read your mind" unless formate_valid?(name)

    Object.const_get("#{name.capitalize}Response").new
  end

  private

  def formate_valid?(name)
    %i[html json].include?(name)
  end
end
