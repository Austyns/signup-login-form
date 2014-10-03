class User < ActiveRecord::Base

	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	 validates :user_name,   :presence => true,
	                         :length => { :within => 6..25 },
		                     :uniqueness => true
	  # validates :email, :presence => true,
	                        #:length => { :maximum => 50 }
	 validates :email,  :presence => true,
	                    :length => { :maximum => 30 },
	                    :format => EMAIL_REGEX
     validates :phone,  :presence => true,
                        :length => { :maximum => 12 }

end
