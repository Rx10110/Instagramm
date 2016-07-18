class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def show
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      redirect_to @pic, notice: "Pic posted!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # if @pic.update(params[:pic].permit(:title, :description))
    #   redirect_to @pic
    # else
    #   render 'edit'
    # end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end


  private

  def find_pic
    @pic = Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(
    :title,
    :description
    )
  end

end
