class PerfumesController < ApplicationController
  def index
    age = params[:age].to_i
    sex = params[:sex].to_i
    glasses = params[:glasses].to_i
    paper = params[:paper].to_i
    sleep = params[:sleep].to_i
    angry = params[:angry].to_i
    down = params[:down].to_i
    eye = params[:eye].to_i
    tired = params[:tired].to_i
    hand = params[:hand].to_i 
    
    # age = params[:age]
        # sex = params[:sex]
        # glasses = params[:glasses]
        # paper =params[:paper]
        # sleep =params[:sleep]
        # angry =params[:angry]
        # down =params[:down]
        # eye = params[:eye]
        # tired =params[:tired]
        # hand =params[:hand]

        @result = age + sex + glasses + paper + sleep + angry + down + eye + tired + hand
        @perfumes = Perfume.all
    # end
 
  end


  def top
    @perfume = Perfume.new
  end
  def new
    @perfume = Perfume.new
  end

  def show
    @perfume = Perfume.find_by(id: params[:id])
  end

  def create
    @perfume = Perfume.new(perfume_params)
    params[:perfume][:question] ? @perfume.question = params[:perfume][:question].join("") : false
    if @perfume.save
        flash[:notice] = "診断が完了しました"
        redirect_to perfume_path(@perfume.id)
    else
        redirect_to :action => "new"
    end
  end

private
  def perfume_params
      params.require(:perfume).permit(:id, question: [])
  end
end

