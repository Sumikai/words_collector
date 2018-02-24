class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [ :new, :edit, :show, :destroy, :favorite]

  # GET /words
  # GET /words.json
  def index
    if params[:tag]
      @search_words = Word.tagged_with(params[:tag])
    else
      @search_words = Word.search(params[:search])
    end
  end

  # GET /words/new
  def new
    if params[:back]
      @word = Word.new(word_params)
    else
      @word = Word.new
    end
  end

  # POST /words
  # POST /words.json
  def create
    @word = current_user.words.build(word_params)
    respond_to do |format|
      if @word.save
        format.html { redirect_to words_path }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /words/1
  # GET /words/1.json
  def show
    @favorite = current_user.favorites.find_by(word_id: @word.id)
    @user = @word.user_id
    if params[:tag]
      @word = Word.tagged_with(params[:tag])
    else
     @word = Word.find_by(id: params[:id])
    end
  end
  
  # GET /words/1/edit
  def edit
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:title, :content, :user_id, :name, :tag_list)
    end
end