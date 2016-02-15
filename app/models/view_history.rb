class ViewHistory < ActiveRecord::Base
  belongs_to :nueron
  belongs_to :user
end
