class Synapse < ActiveRecord::Base
  belongs_to :origin, class_name: "User"
  belongs_to :next, class_name: "User"
end
