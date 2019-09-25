class ExercizesController < ApplicationController
  before_action :set_exercize, only: [:show, :edit, :update, :destroy]

  # GET /exercizes
  # GET /exercizes.json
  def index
    @exercizes = Exercize.all
  end

  # GET /exercizes/1
  # GET /exercizes/1.json
  def show
  end

  # GET /exercizes/new
  def new
    @exercize = Exercize.new
  end

  # GET /exercizes/1/edit
  def edit
  end

  # POST /exercizes
  # POST /exercizes.json
  def create
    @exercize = Exercize.new(exercize_params)

    respond_to do |format|
      if @exercize.save
        format.html { redirect_to @exercize, notice: 'Exercize was successfully created.' }
        format.json { render :show, status: :created, location: @exercize }
      else
        format.html { render :new }
        format.json { render json: @exercize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercizes/1
  # PATCH/PUT /exercizes/1.json
  def update
    respond_to do |format|
      if @exercize.update(exercize_params)
        format.html { redirect_to @exercize, notice: 'Exercize was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercize }
      else
        format.html { render :edit }
        format.json { render json: @exercize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercizes/1
  # DELETE /exercizes/1.json
  def destroy
    @exercize.destroy
    respond_to do |format|
      format.html { redirect_to exercizes_url, notice: 'Exercize was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercize
      @exercize = Exercize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercize_params
      params.require(:exercize).permit(:name, :weight, :workout_id)
    end
end
