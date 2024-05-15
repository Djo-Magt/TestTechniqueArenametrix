class FileItemsController < ApplicationController
  before_action :set_file_params, only: [:destroy]

  def index
    @file_items = FileItem.all
    @file_item = FileItem.new
  end

  def create
    @file = FileItem.new(file_item_params)
    if @file.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @file_item = FileItem.find(params[:id])
    @file_item.destroy
    redirect_to root_path
  end


  private

  def file_item_params
    params.require(:file_item).permit(:name, :csv_file)
  end

  def set_file_params
    @file = FileItem.find(params[:id])
  end
end
