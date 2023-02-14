class Color
  def name
    raise NotImplementedError
  end

  def degree
    raise NotImplementedError
  end
end

class Red < Color
  def name
    'red'
  end

  def degree
    15
  end
end

class Blue < Color
  def name
    'blue'
  end

  def degree
    10
  end
end
