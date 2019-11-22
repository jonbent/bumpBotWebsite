class User < ApplicationRecord
    validates :username, :discriminator, :_id, :email, presence: true
    validates :username, uniqueness: {
        scope: :discriminator,
        message: "Cannot have duplicate Users"    
    }
    has_many :guilds
end
