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

end
