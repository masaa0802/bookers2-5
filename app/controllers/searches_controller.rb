class SearchesController < ApplicationController
    def search
		@book = Book.new
			# book
		if params[:word].present? && params[:model] === "Book" && params[:search] === "perfect"
			@books = Book.where('title LIKE ?', "#{params[:word]}")


		elsif params[:word].present? && params[:model] === "Book" && params[:search] === "front"
			@books = Book.where('title LIKE ?', "#{params[:word]}%")

		elsif params[:word].present? && params[:model] === "Book" && params[:search] === "back"
			@books = Book.where('title LIKE ?', "%#{params[:word]}")


		elsif params[:word].present? && params[:model] === "Book" && params[:search] === "part"
			@books = Book.where('title LIKE ?', "%#{params[:word]}%")
		else
       @books = Book.none

		end

		# user
		if params[:word].present? && params[:model] === "User" && params[:search] === "perfect"
			@users = User.where('name LIKE ?', "#{params[:word]}")

		elsif params[:word].present? && params[:model] === "User" && params[:search] === "front"
			@users = User.where('name LIKE ?', "#{params[:word]}%")

		elsif params[:word].present? && params[:model] === "User" && params[:search] === "back"
			@users = User.where('name LIKE ?', "%#{params[:word]}")

		elsif params[:word].present? && params[:model] === "User" && params[:search] === "part"
			@users = User.where('name LIKE ?', "%#{params[:word]}%")
		else
      @users = User.none
		end
    end
end