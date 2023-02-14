class Furniture
  def chair
    raise NotImplementedError
  end

  def sofa
    raise NotImplementedError
  end

  def table
    raise NotImplementedError
  end
end

class ModernFurniture
  def chair
    ModernChair.new
  end

  def sofa
    ModernSofa.new
  end

  def table
    ModernTable.new
  end
end

class VictorianFurniture
  def chair
    VictorianChair.new
  end

  def sofa
    VictorianSofa.new
  end

  def table
    VictorianTable.new
  end
end

#----
class Chair
  def seton
    raise NotImplementedError
  end
end

class ModernChair < Chair
  def seton
    'seton in ModernChair'
  end
end

class VictorianChair < Chair
  def seton
    'seton in VictorianChair'
  end
end

#----
class Sofa
  def seton
    raise NotImplementedError
  end
end

class ModernSofa < Sofa
  def seton
    'seton in ModernSofa'
  end
end

class VictorianSofa < Sofa
  def seton
    'seton in VictorianSofa'
  end
end

#----
class Table
  def puton
    raise NotImplementedError
  end
end

class ModernTable < Table
  def puton
    'puton in ModernTable'
  end
end

class VictorianTable < Table
  def puton
    'puton in VictorianTable'
  end
end
#----
# main

# this is factory method as it retruns one object not families
def furniture(type)
  (if type == :modern
     ModernFurniture
   elsif type == :victorian
     VictorianFurniture
   end).new
end

furn = furniture(:modern)
puts [furn.chair.seton, furn.sofa.seton, furn.table.puton].join(', ')

furn = furniture(:victorian)
puts [furn.chair.seton, furn.sofa.seton, furn.table.puton].join(', ')
