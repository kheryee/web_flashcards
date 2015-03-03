class User < ActiveRecord::Base
  has_many :urls

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  # validate :validate_email_format


  # def validate_email_format
  #   errors.add(:email, "Invalid email") unless email.scan(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)[0]
  # end
  # rescue
  #   false
  # end

  private

  def self.authenticate(email, password)
    @user = User.where(email: email)[0]
    if @user && (@user.password == password)
      return @user
    else
      nil
    end
  end
end
