# An example OpenReadController
class QuestionsController < ProtectedController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /answer
  # GET /answer.json
  def index
    @question = Question.all

    render json: @questions
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    render json: Question.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answer/1.json
  def update
    if @question.update(question_params)
      head :no_content
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @question.destroy

    head :no_content
  end

  def set_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end
end
