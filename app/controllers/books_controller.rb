class BooksController < ApplicationController
  def index
   @book = Book.new
   @books = Book.all
   @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @apple = Book.new #変数名はなんでもよい
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id  #紐付け
    if @book.save
      flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(@book.id)
      else
          @user = current_user
          @books = Book.all
          render:index
    end
  end


  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id  #紐付け
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :edit
    end
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
