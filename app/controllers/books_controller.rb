class BooksController < ApplicationController
	def create
		book= Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to user_path(current_user.id)
  end

  def index
  end

  def show
  	@book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to user_path(current_user.id)
  end
  private
  def book_params
  	params.require(:book).permit(:title,:opinion,)
  end
end