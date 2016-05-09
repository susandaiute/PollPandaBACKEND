# An example OpenReadController
class QuestionsController < ProtectedController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /question
  # GET /question.json
  def index
    @questions = current_user.questions

    render json: @questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    render json: Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /question/1.json
  def update
    if @question.update(question_params)
      head :no_content
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy

    head :no_content
  end

  def set_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :answer1, :answer2, :answer3)
  end
end
