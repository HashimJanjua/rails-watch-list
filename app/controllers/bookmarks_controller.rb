class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def index
    @list = List.find(params[:list_id])
    @bookmarks = @list.bookmarks
    # @bookmarks = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.movie = @movie
    @bookmark.save!
    redirect_to list_bookmarks_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
