class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email
    validates_uniqueness_of :email
    has_many :events
    has_many :rosters

    # a user must have a secure password
    # validation of required params to ensure these params are filled out in forms
    # validation of uniqueness of email
    # a user has many events and many rosters
end
