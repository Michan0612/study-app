class Micropost < ApplicationRecord
    belongs_to :user
    has_one_attached :picture

    validates :user_id, presence: true
    validates :only_user_id, presence: true

    def resize_picture
      return self.picture.variant(resize: '100x100').processed
    end

    private
    def only_user_id
      time.presence || memo.presence || picture.presence
    end    
    

end
