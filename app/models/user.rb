class User < ActiveRecord::Base
	
	# Should have a name and an email address
	# Email address should be properly formatted (@, .com / other domain)
	# Name should be at least 6 characters long
	
	has_many :submissions

	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, 
	  length: { in: 6..32 }
	validates :email, presence: true, 
	  format: { with: VALID_EMAIL_REGEX },
	  uniqueness: { case_sensitive: false } # Refer to section 6.2 re: database indices
  validates :password, length: { minimum: 6 }

  
  has_secure_password

end
