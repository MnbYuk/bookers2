class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def edit
    @book = Book.new
    @book_a = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice_book_create] = "You have created book successfully."
      redirect_to books_path
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice_book_update] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path
  end


  def show
    @book = Book.new
    @book_a = Book.find(params[:id])
    @user = @book_a.user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
