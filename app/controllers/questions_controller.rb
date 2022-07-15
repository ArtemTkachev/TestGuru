class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render plain: "QUESTIONS: \n#{@questions.inspect}\nPARAMETERS: \n#{params.inspect}"
  end

  def show
    render plain: "QUESTION: \n#{@question.inspect}\nPARAMETERS: \n#{params.inspect}"
  end

  def destroy
    @question.destroy
    render plain: "The question has been deleted.\nPARAMETERS: \n#{params.inspect}"
  end

  def new
  end

  def create
    @question = @test.questions.create(question_params)
    render plain: "CREATED QUESTION: \n#{@question.inspect}\nPARAMETERS: \n#{params.inspect}"
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
