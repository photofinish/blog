class AtriclesController < ApplicationController

  def index
    @atricles = Atricle.where(user_id: (params[:user_id].presence || current_user.id) )
  end

  def new
    @atricle = current_user.atricles.new
  end

  def create
    atricle = current_user.atricles.build atricle_param
    if atricle.save
      redirect_to atricle_path(atricle), notice: 'created'
    else
      render :new, alter: 'something error'
    end
  end

  def show
    @atricle = Atricle.find(params.require(:id))
  end

  def update
    @atricle = Atricle.find(params.require(:id))
    if @atricle.update atricle_param
      redirect_to atricle_path(@atricle), notice: 'updated'
    else
      render :edit, alter: 'something error'
    end
  end

  def edit
    @atricle = Atricle.find(params.require(:id))
    @histories = @atricle.histories
    if params[:restore_id]
      history = @histories.find params[:history_id]
      @atricle.title = history.title
      @atricle.body = history.body
    end
  end

  private

  def atricle_param
    params.require(:atricle).permit(:title, :body)
  end
end
