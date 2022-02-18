class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list), notice: 'bookmark was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end


    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end

end
