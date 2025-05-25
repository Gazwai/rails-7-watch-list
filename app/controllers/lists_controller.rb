class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List was successfully created."
      redirect_to @list
    else
      render :index, status: :unprocessable_entity # Re-renders the new form with errors
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
