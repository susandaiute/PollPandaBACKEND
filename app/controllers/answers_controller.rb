# An example OpenReadController
class AnswersController < OpenReadController
  before_action :set_answer, only: [:update, :destroy]

  # GET /answer
  # GET /answer.json
  def index
    @answer = Answer.all

    render json: @answers
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    render json: Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = current_user.answers.build(answer_params)

    if @answer.save
      render json: @answer, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answer/1.json
  def update
    if @answer.update(answer_params)
      head :no_content
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy

    head :no_content
  end

  def set_answer
    @answer = current_user.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:text)
  end
end
