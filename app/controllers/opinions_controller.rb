class OpinionsController < ApplicationController
  before_action :require_login, only: %i[create show index]

  def create
    @opinion = Opinion.new(opinion_param)
    @opinion.author_id = current_user.id

    if @opinion.save
      current_user.opinion_count += 1
      current_user.save
      redirect_to home_path
    else
      flash[:notice] = '280 characters in comment is the maximum allowed.'
      redirect_to home_path
    end
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def index
    @opinion = Opinion.new
  end

  def require_login
    redirect_to login_path unless current_user
  end

  private

  # Only allow a list of trusted parameters through.
  def opinion_param
    params.require('opinion').permit(:text)
  end
end
