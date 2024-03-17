class KanjisController < ApplicationController
  before_action :set_kanji, only: %i[ show ]

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
    if sentence.empty?
      render json: { error: "Sentence cannot be empty" }, status: :bad_request
      return
    end

    kanjis = sentence.scan(/\p{Han}/) # This regex will match all kanji characters
    if kanjis.empty?
      render json: { error: "Sentence must contain at least one Kanji character" }, status: :bad_request
      return
    end

    kanji_conditions = kanjis.map { |k| "'#{k}'" }.join(', ')
    query = "kanji IN (#{kanji_conditions})"
    @kanjis = Kanji.where(query)
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
