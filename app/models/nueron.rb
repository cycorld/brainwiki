class Nueron < ActiveRecord::Base
  has_many :active_links, class_name: "Synapse",
                          foreign_key: "prev_id",
                          dependent: :destroy
end
