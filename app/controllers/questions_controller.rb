class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show destroy edit update]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    redirect_to test_path(@test)
    test = Test.first
  end

  def show; end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      respond_to do |format|
        format.html { redirect_to test_question_path(@test, @question) }
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      respond_to do |format|
        format.html { redirect_to test_question_path(@test, @question) }
      end
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Sorry. Question was not found.'
  end
end
