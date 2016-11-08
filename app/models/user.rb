class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	#santo
  validates :firstname, presence: true, :on=>:create
  validates :lastname, presence: true, :on=>:create

  #santo
	def archive
		self.update(archived_at: Time.now)
	end

	#santo
	def active_for_authentication?
		super && archived_at.nil?
	end

	#santo
	def inactive_message
		archived_at.nil? ? super : :archived
	end

end
