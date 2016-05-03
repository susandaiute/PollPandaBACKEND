
class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :answer1, :answer2, :answer3, :editable

  def editable
    scope == object.user
  end
end
