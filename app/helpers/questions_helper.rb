module QuestionsHelper

  def question_header
    return t('.new_question') if @question.new_record?
    t('.edit_question')
  end

  def form_button
    return t('create') if @question.new_record?
    t('update')
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
