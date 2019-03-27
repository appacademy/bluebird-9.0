# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  chirp_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  belongs_to :liker,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :chirp,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :Chirp
end
