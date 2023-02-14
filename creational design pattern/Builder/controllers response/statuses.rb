module Statuses
  def created!
    @response.status = Status.new(code: 201, message: 'Created')
  end

  def not_found!
    @response.status = Status.new(code: 404, message: 'Not Found')
  end

  def deleted!
    @response.status = Status.new(code: 204, message: 'Deleted')
  end
end
