# == Schema Information
#
# Table name: twists
#
#  id         :bigint(8)        not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Twist < ApplicationRecord
  validates :body, presence: true

  # belongs_to(:author, { foreign_key: :author_id, primary_key: :id, class_name: :User })
  # the belongs_to method will also validate that we have an author_id and that user exists.
  belongs_to :author,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :User

  has_one :location, 
    through: :author, 
    source: :location
end
