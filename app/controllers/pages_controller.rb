class PagesController < ApplicationController
  def index
    @estates = Estate.order('created_at DESC')
  end
end
