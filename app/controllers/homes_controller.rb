class HomesController < ApplicationController
  def index
    @artikels = Artikel.all.order(created_at: :desc).limit(4)
    @blogs = Blog.all.order(created_at: :desc).limit(3)
  end
end
