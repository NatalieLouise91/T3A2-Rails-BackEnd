class Role < ApplicationRecord
    has_many :rosters, dependent: :destroy, autosave: true
end
