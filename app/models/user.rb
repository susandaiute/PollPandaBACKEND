#
class User < ActiveRecord::Base
  include Authentication
  has_many :answers
  has_many :questions, inverse_of: :user, foreign_key: 'user_id'
end
