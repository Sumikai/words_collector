module WordsHelper
  def choose_new_or_edit
    if action_name == 'edit'
      word_path
    end
  end
end
