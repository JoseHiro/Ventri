class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @rental = Rental.find(params[:rental_id]);
    #@user    add user to write review to the user

  end

  def create
    @review = Review.new(review_params)
    @review.writer_id = current_user.id
    # this is going to be page
    @review.user_id = 1
    if @review.save
      redirect_to root_path
    else
      redirect_to new_rental_review_path(@review)
    end
  end


  # get all the reviews from the user

  # def index
  #   @reviews = Reviews.find_by(user.id = @user)
  # end

  private

  def review_params
    params.require(:review).permit(:rating, :feedback)
  end

end
