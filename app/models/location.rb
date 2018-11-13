# == Schema Information
#
# Table name: locations
#
#  id         :bigint(8)        not null, primary key
#  place      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  validates :place, presence: true

  has_many :users,
    foreign_key: :location_id,
    primary_key: :id,
    class_name: :User

  has_many :twists,
    through: :users,
    source: :twists
end
