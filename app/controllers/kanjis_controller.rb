class KanjisController < ApplicationController
  before_action :set_kanji, only: %i[ show edit update destroy ]

  # GET /kanjis or /kanjis.json
  def index
    @kanjis = Kanji.all
  end

  def test
    @kanjis = Kanji.all
    render json: @kanjis
  end

  # GET /kanjis/1 or /kanjis/1.json
  def show
  end

  # GET /kanjis/new
  def new
    @kanji = Kanji.new
  end

  # GET /kanjis/1/edit
  def edit
  end

  # POST /kanjis or /kanjis.json
  def create
    @kanji = Kanji.new(kanji_params)

    respond_to do |format|
      if @kanji.save
        format.html { redirect_to kanji_url(@kanji), notice: "Kanji was successfully created." }
        format.json { render :show, status: :created, location: @kanji }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kanji.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    sentence = params[:sentence].strip
    kanjis = sentence.scan(/\p{Han}/) # This regex will match all kanji characters
    kanji_conditions = kanjis.map { |k| "'#{k}'" }.join(', ')
    query = "kanji IN (#{kanji_conditions})"
    @kanjis = Kanji.where(query)
  end

  # PATCH/PUT /kanjis/1 or /kanjis/1.json
  def update
    respond_to do |format|
      if @kanji.update(kanji_params)
        format.html { redirect_to kanji_url(@kanji), notice: "Kanji was successfully updated." }
        format.json { render :show, status: :ok, location: @kanji }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kanji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kanjis/1 or /kanjis/1.json
  def destroy
    @kanji.destroy!

    respond_to do |format|
      format.html { redirect_to kanjis_url, notice: "Kanji was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kanji
      @kanji = Kanji.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kanji_params
      params.require(:kanji).permit(:kanji, :frame_number, :radicals, :rank)
    end
end
