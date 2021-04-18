class Admin::BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @book.user_id = @user.id
    @book.update(book_params)
    redirect_to admin_books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:name, :body, :book_image)
  end
end
