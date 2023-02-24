class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    p params
    p '---------------------'
    @list = List.find(params[:list_id])
    p  @list
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new(list_id: @list.id, movie_id: @movie.id, comment: 'zobgfdgfd')
    @bookmark.save!
    redirect_to list_path(@list)
    # @bookmark.list = @list
    # @bookmark = Bookmark.new(bookmark_params)
    # if @bookmark.save
    #   redirect_to list_path(@list)
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
