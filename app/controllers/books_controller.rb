# standard Rails controller for the books model
class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # standard index method - show all books
  # books ordered by sort_title; additional variable @pagy for pagination
  def index
    @pagy, @books = pagy(Book.includes([cover_attachment: :blob]).order(:sort_title))
  end

  # Standard show method - show book details
  def show
  end

  # standard new method - show form for new book
  def new
    @book = Book.new
  end

  # creation / storage of a new book
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: "Book saved"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # standard edit method - show form for editing book
  def edit

  end

  # update of a book
  def update

  end

  # standard destroy method
  def destroy

  end

  private

  # define an instance variable @book
  def set_book
    @book = Book.find(params[:id])
  end

  # define allowed parameters
  def book_params
    params.require(:book).permit(:title, :original_title, :sort_title, :edition, :rating, :condition, :year, :cover)
  end
end
