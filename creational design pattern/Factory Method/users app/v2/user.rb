class User
  def say
    "I am #{self.class.name}"
  end
end
class Admin < User;end
class Member < User;end
class Guest < User;end