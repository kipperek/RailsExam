class GistsController < ApplicationController
  before_action :set_gist, only: [:show, :edit, :update, :destroy]
  before_filter :is_user_logged?, :except => [:index, :show, :search]

  # GET /gists
  # GET /gists.json
  def index
    @gists = Gist.order("created_at desc").search(params[:desc]) # pagination
    @gists = Kaminari.paginate_array(@gists).page(params[:page])
    # @gists = Gist.all
  end

  # GET /gists/1
  # GET /gists/1.json
  def show
  end

  # GET /gists/new
  def new
    @gist = Gist.new
  end

  # GET /gists/1/edit
  def edit
  end

  # POST /gists
  # POST /gists.json
  def create
    @gist = Gist.new(change_lang(gist_params))
    @gist.user = User.find(session[:user_id])

    respond_to do |format|
      if @gist.save
        format.html { redirect_to @gist, notice: 'Gist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gist }
      else
        format.html { render action: 'new' }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gists/1
  # PATCH/PUT /gists/1.json
  def update
    respond_to do |format|
      if @gist.update(change_lang(gist_params))
        format.html { redirect_to @gist, notice: 'Gist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gists/1
  # DELETE /gists/1.json
  def destroy
    @gist.destroy
    respond_to do |format|
      format.html { redirect_to gists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gist
      @gist = Gist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gist_params
      params.require(:gist).permit(:snippet, :lang, :description)
    end

    def not_allowed?(lang)
      allowed = Pygments.lexers.flatten.select.with_index{|a,i| (i+1) % 2 == 0}
      allowed = allowed.map{|a| a[:aliases][0]}
      allowed = allowed.delete_if{|a| (/-cpp/ =~ a || /-objc/ =~ a)}
      allowed = allowed.sort

      good_lang = false
      allowed.each do |a|

        if a == lang
          good_lang = true
          break
        end

      end

      !good_lang
    end

    def change_lang(gists)
     
      if not_allowed?(gists[:lang])
        gists[:lang] = "text"
      end

      return gists
    end

end
