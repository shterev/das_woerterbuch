class My::WordsController < My::CommonController

  before_action :redirect_on_missing_word_type, only: [:new, :create]
  before_action :redirect_on_invalid_word_type, only: [:new, :create]

  def index
    @words = current_user.words.order(:foreign_form)
    @words = @words.where(type: params[:type]) if params[:type].present?
  end

  def show
    @word = user_word_from_param
  end

  def new
    @word = Word.new(type: params[:type])
  end

  def create
    @word = Word.new(word_params.merge(type: params[:type]))

    if @word.save
      current_user.words << @word
      redirect_to my_words_path, notice: 'Word successfully created.'
    else
      flash.now[:error] = 'Word not created successfully.'
      render :new
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

  def destroy
    @word = user_word_from_param

    if @word.destroy
      flash[:notice] = 'The word was deleted successfully.'
    end

    redirect_to back_or_default(my_words_path)
  end

  private

  def user_word_from_param
    current_user.words.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:foreign_form, :known_form, :type, :specifics)
  end

  def redirect_on_invalid_word_type
    redirect_to my_words_path and return unless Word.inheritors.include?(params[:type])
  end

  def redirect_on_missing_word_type
    redirect_to my_words_path and return if params[:type].nil?
  end

end