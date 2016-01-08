class Nueron < ActiveRecord::Base
  has_many :active_links, class_name: "Synapse",
                          foreign_key: "origin_id",
                          dependent: :destroy
  has_many :passive_links, class_name: "Synapse",
                           foreign_key: "next_id",
                           dependent: :destroy
  has_many :next, through: :active_links, source: :next
  has_many :prev, through: :passive_links, source: :origin
end
