class User < ActiveRecord::Base

  has_secure_password

  validates :password, :length => {:minimum => 8}
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  # def existing_email?(email)
  #   emails = User.select('email').from('users')
  #   if emails.include?(email)
  #     p "#{email}"
  #     true
  #   else
  #     false
  #   end
  # end

  def user_with_same_email(email)
    user = User.find_by_email(email.strip.downcase)
    if user
      true
    else
      false
    end
  end

end
