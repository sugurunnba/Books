class Admin::BookCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    book = Book.find(params[:book_id])
    book_comment = BookComment.find_by(book_id: book.id)
    book.destroy
    redirect_to admin_book_path(book)
  end
end
