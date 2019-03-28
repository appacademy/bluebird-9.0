# == Schema Information
#
# Table name: chirps
#
#  id         :bigint(8)        not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chirp < ApplicationRecord
  validates :body, presence: true
  validate :check_length_one

  belongs_to :author, 
    primary_key: :id, 
    foreign_key: :author_id, 
    class_name: :User
  
  has_many :likes,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :Like

  has_many :likers,
    through: :likes,
    source: :liker

  has_many :comments,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :Comment

  def check_length_one
    if self.body.length == 1
      errors[:body].push("Chuck Norris thinks your message is too short.")
    end
  end
end
