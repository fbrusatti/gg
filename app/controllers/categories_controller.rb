class CategoriesController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!


  def index
    respond_to do |format|
      format.html
      # if params[:q].present?
        @categories = Category.joins(:referrer)
        format.json { render json: @categories.where(
                                    "categories.name ILIKE ?",
                                    "%#{params[:q]}%").to_json(:include => :referrer)
                                    }
      # else
      #   # format.json { render json: PropertiesDatatable.new(view_context) }
      # end
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    flash[:success] = t('flash.category', message: t('flash.created')) if @category.save
    respond_with(@category)
  end

end
