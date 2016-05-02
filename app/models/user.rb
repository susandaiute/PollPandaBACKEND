#
class User < ActiveRecord::Base
  include Authentication
  has_many :answers
  has_many :questions
end
