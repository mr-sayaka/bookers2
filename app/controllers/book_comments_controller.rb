class BookCommentsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    comment = Current.user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @book }
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @book }
    end
  end


=begin
  def create
    @book = Book.find(params[:book_id])
    Current.user.favorites.create(book_id: @book.id)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @book }
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = Current.user.favorites.find_by(book_id: @book.id)
    favorite.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @book }
    end
  end
=end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
