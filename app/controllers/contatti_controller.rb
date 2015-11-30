class ContattiController < ApplicationController
  before_action :set_contatto, only: [:show, :edit, :update, :destroy]

  # GET /contatti/1
  # GET /contatti/1.json
  def show
  end

  # GET /contatti/new
  def new
    @contatto = current_user.contatti.build
    @contatto.telefoni.build
    @contatto.indirizzi.build
  end

  # GET /contatti/1/edit
  def edit
    @contatto.indirizzi.build unless @contatto.indirizzi.any?
  end

  # POST /contatti
  # POST /contatti.json
  def create
    @contatto = current_user.contatti.build(contatto_params)
    respond_to do |format|
      if @contatto.save
        format.html { redirect_to @contatto, notice: 'Contatto was successfully created.' }
        format.json { render :show, status: :created, location: @contatto }
      else
        format.html { render :new }
        format.json { render json: @contatto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contatti/1
  # PATCH/PUT /contatti/1.json
  def update
    respond_to do |format|
      if @contatto.update(contatto_params)
        format.html { redirect_to @contatto, notice: 'Contatto was successfully updated.' }
        format.json { render :show, status: :ok, location: @contatto }
      else
        format.html { render :edit }
        format.json { render json: @contatto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contatti/1
  # DELETE /contatti/1.json
  def destroy
    @contatto.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Contatto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contatto
      @contatto = Contatto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contatto_params
      params.require(:contatto).permit(:nome, :nota, :user_id, 
                                telefoni_attributes: [:id, :numero_di_telefono, :tipo, :_destroy],
                                indirizzi_attributes: [:id, :indirizzo, :cap, :citta, :tipo, :_destroy])
    end
end
