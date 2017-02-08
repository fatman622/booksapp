class BooksController < ApplicationController
before_action :authenticate_user!
before_action :find_book, only: [:edit, :update, :destroy, :show]

	def index
		@books= current_user.books
		# @books = Book.all
		@book = Book.new
	end

	def show
    	@book
  	end

	def new
		@book = Book.new
	end

	def create
	 	@book = Book.new(book_params)
 		@book.user_id = current_user.id 
	  	respond_to do |format|
	    if @book.save
	      format.html { redirect_to @book, notice: 'User was successfully created.' }
	      format.js   {}
	      format.json { render json: @book, status: :created, location: @book }
	    else
	      format.html { render action: "new" }
	      format.json { render json: @book.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def edit
		@book
	end

	def update
		@book = Book.find(params[:id])
		@book.update_attributes(params[:id])

		respond_to do |format|
		format.js do
		  render(:update) { |page| page.reload }
		end
		end
	end

  	def destroy
  		@book.destroy
	    flash[:success] = "Book deleted"
	    redirect_to '/books'
  	end

	private

	def find_book
		@book = Book.find(params[:id])
	end	

	def book_params
		params.require(:book).permit(:name, :autor, :genre, :year)
	end
end
