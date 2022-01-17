class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email
    validates_uniqueness_of :email
    has_many :events
    has_many :rosters

#        # method to send a token to users email when resetting password 
#    def send_password_reset
#     self.reset_password_token = generate_base64_token
#     self.reset_password_sent_at = Time.zone.now
#     save!
#     UserMailer.password_reset(self).deliver_now
#    end

# #   method to check if token was sent via email longer than an hour and if so set validity
#   def password_token_valid?
#     (self.reset_password_sent_at + 1.hour) > Time.zone.now
#   end

# #   method to set new password on user record
#   def reset_password(password)
#     self.reset_password_token = nil
#     self.password = password
#     save!
#   end

#   private
# # method to generate secure random token to be sent via email
#   def generate_base64_token
#     test = SecureRandom.urlsafe_base64
#   end

end