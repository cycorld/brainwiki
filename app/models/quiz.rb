class Quiz < ActiveRecord::Base
  belongs_to :nueron
  belongs_to :user
  serialize :answers
  serialize :question
  store :answers, accessors: [:array, :correct]
end
