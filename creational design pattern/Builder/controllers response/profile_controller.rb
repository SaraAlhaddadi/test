require_relative './base_controller.rb'

# Director
class ProfileController < BaseController
  def index
    builder = build(@params[:formate])
    builder.body = @params[:body]
    builder.content_type!
    builder.created!
    response = builder.response

    puts response
  end

  def delete
    builder = build(@params[:formate])
    builder.content_type!
    builder.deleted!
    response = builder.response

    puts response
  end
end

ProfileController.new(params: { body: 'data', formate: :html }).index
puts "\n ---- \n"

ProfileController.new(params: { body: 'no data', formate: :json }).delete
