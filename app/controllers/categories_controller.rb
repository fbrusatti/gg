class CategoriesController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!


  def index
    respond_to do |format|
      format.html { render html: @categories =Category.all}
      format.json { render json: Category.where(
                                    "categories.name ILIKE ?",
                                    "%#{params[:q]}%").to_json(:include => :referrer)
                                    }
    end
  end

  def new
    @category = Category.new
    if request.xhr?
      render partial: 'new_category_modal'
    end  
  end

  def create
    @category = Category.new(params[:category])
    flash[:success] = t('flash.category', message: t('flash.created')) if @category.save
    respond_with(@category)
  end

end
