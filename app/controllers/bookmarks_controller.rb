class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmarks = Bookmark.where(id: params.dig(:bookmark, :movie))
    return render_new if @movies.empty?

    ActiveRecord::Base.transaction do
      @bookmarks.each do |bookmark|
        bookmark = Bookmark.new(list: @list, movie: movie)
        bookmark.save!
      end
      redirect_to movie_path(@list.movie)
    end
  rescue ActiveRecord::RecordInvalid
    render_new
  end

  private

  def render_new
    @bookmark = Bookmark.new
    @bookmark.errors.add(:base, "A selected already exists")
    render :new, status: :unprocessable_entity
  end
end
