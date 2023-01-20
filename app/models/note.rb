class Note < ApplicationRecord
    has_rich_text :body
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    belongs_to :user
end
