module QuestionsHelper
  QUESTION_ACTIONS = { new: 'Create new', edit: 'Edit' }.freeze

  def question_header(question, action)
    "#{QUESTION_ACTIONS[action]} #{question.test.title} Question"
  end
end
