# An example for user of the template
class Answer < ActiveRecord::Base
  belongs_to :user
  validates :text, :user, presence: true
end
