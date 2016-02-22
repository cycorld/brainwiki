class Synapse < ActiveRecord::Base
  belongs_to :origin, class_name: "Nueron"
  belongs_to :next, class_name: "Nueron"
  validates :origin_id, presence: true
  validates :next_id, presence: true
  validates :user_id, presence: true

  default_scope { order('id ASC') }
end
