class Question < ActiveRecord::Base
  belongs_to :user, inverse_of: :questions
end
## add class_name??
