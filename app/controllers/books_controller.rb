class BooksController < ApplicationController
# before_action :authenticate_user!
before_action :find_book, only: [:edit, :update, :destroy, :show]

	api :GET, "/books" ,"This is books index"
	param :books, Hash, :desc => "All books" do
	end
	param :book, Hash, :desc => "For create new book" do
	end
	def index
		# @books= current_user.books
		@books = Book.all
		@book = Book.new
	end

	api :GET, "/books/show" ,"This is show method" do
		param :id, Integer, :desc => "Id for show by id", :required => true
	end
	def show
    	@book
    	respond_to do |format|
    		format.html
    		 format.json{render json: @book}
    	end
  	end

  	api :GET, "/books/new" ,"View new"
	def new
		@book = Book.new
	end

	api :POST, "/books/create","Create book with this params" do
	param :name, String, :desc => "name", :required => true 
	param :autor, String, :desc => "autor", :required => true
	param :genre, String, :desc => "genre", :required => true
	param :year, Integer, :desc => "year", :required => true
	param :user_id, Integer, :desc => "user id for save his books", :required => true
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

	api :GET, "/books/:id/edit","View edit"
	def edit
		@book
	end

	api :PATCH, "/books/:id","Get id book and update attribures for object" do
	param :name, String, :desc => "name", :required => false
	param :autor, String, :desc => "autor", :required => false
	param :genre, String, :desc => "genre", :required => false
	param :year, Integer, :desc => "year", :required => false
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

	api :DELETE, "/books/:id","Get id book "
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
