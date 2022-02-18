class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'list was successfully added.'
    else
      render :new
    end
  end

  private

    def set_list
      @list = List.find(params[:id])
    end


    def list_params
      params.require(:list).permit(:name, :photo)
    end


end
