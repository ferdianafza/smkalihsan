class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @artikels = Artikel.all.order(created_at: :desc).limit(4)
    @blogs = Blog.all.order(created_at: :desc).limit(3)
  end

  def show
    @laporan = current_user.daily_reports.all.order(created_at: :desc )
    # .page params[:page]
  end
end
