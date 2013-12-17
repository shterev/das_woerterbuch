class My::WordsController < My::CommonController

  def index
    @words = current_user.words.order(:foreign_form)
  end

  def show
    @word = user_word_from_param
  end

  def new
    @word = Word.new(type: params[:type])
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      current_user.words << @word
      redirect_to my_words_path, notice: 'Word successfully created.'
    else
      redirect_to my_words_path, alert: 'Word not created successfully.'
    end

  end

  def edit
    @word = user_word_from_param
  end

  def update
    @word = user_word_from_param

    if @word.update_attributes(word_params)
      redirect_to back_or_default(my_words_path), notice: 'The word was successfully updated.'
    else
      flash.now[:error] = 'The word was not updated successfully.'
      render :edit
    end
  end

  private

  def user_word_from_param
    current_user.words.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:foreign_form, :known_form, :type, :specifics)
  end

end