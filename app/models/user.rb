class User < ActiveRecord::Base


  def self.authenticate(email, password)
    @user = User.where(email: email)[0]
    if @user && (@user.password == password)
      return @user
    else
      nil
    end
  end
end
