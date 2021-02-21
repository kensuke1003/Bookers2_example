class BooksController < ApplicationController
  def index
   @book = Book.new
   @books = Book.all
  end
  
  def show
    @book =Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id  #紐付け
    @book.save
    redirect_to books_path
  end

 
  def edit 
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end