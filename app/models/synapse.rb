class Synapse < ActiveRecord::Base
  belongs_to :origin, class_name: "User"
  belongs_to :next, class_name: "User"
  validates :origin_id, presence: true
  validates :next_id, presence: true
end
