class Admin::BooksController < ApplicationController
  before_action :authenticate_admin!
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to admin_books_path
    else
      render :edit
    end
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
