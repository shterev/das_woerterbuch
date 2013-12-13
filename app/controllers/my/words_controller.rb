class My::WordsController < My::CommonController

  def index
    @words = current_user.words
  end

end