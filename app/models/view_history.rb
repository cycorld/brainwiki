class ViewHistory < ActiveRecord::Base
  belongs_to :nueron, counter_cache: :viewcount
  belongs_to :user
end
