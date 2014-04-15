class CardsController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

 	def new
    @card = Card.new
    if request.xhr?
      render partial: 'new_card_data'
    end
  end

  def create
    @card = Card.new(params[:card])
    @card.save
    respond_to do |format|
      format.html { render partial: "new_card_row" }
      format.json { render json: @card }
      format.js
    end
  end

  def show
    @card = Card.find(params[:id])
    respond_to do |format|
      format.html { render partial: "show_card" }
      format.json { render json: @card }
      format.js
    end
  end

  def destroy
    ids = params[:id].split(",")
    ids.map { |c| Card.find(c).destroy }
    respond_with @card
  end

end
