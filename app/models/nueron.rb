class Nueron < ActiveRecord::Base
  has_many :active_links, class_name: "Synapse",
                          foreign_key: "origin_id",
                          dependent: :destroy
end
