class User < ActiveRecord::Base
	has_many :surveys

	validates :email, :username, presence: true
	validates :email, :username, uniqueness: true

	include BCrypt

	def self.authenticate(args)
		user = User.find_by(username: args[:username])
		if user
		  return user if user.password == args[:password]
		else
		  nil
		end
	end

	def password
		@password ||= Password.new(hashed_password)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.hashed_password = @password
	end
end
