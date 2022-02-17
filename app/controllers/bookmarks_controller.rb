class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark, notice: 'bookmark was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    @bookmark.destroy(bookmark_params)
    redirect_to bookmarks_url, notice: 'bookmark was successfully destroyed.'
  end

  private

    def set_bookmark
      @bookmark = bookmark.find(params[:id])
    end


    def bookmark_params
      params.require(:bookmark).permit(:comment)
    end

end
