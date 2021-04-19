class User::BooksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = @user.id
    @book.save!
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:name, :body, :book_image)
  end
end
