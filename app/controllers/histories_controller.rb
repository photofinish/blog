class HistoriesController < ApplicationController

  def index
    @atricle = Atricle.find params[:atricle_id]
    @histories = @atricle.histories
  end

  def show
    @atricle = Atricle.find params[:atricle_id]
    @history = History.find params[:id]
  end
end
