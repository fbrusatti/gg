class CategoriesController < ApplicationController

  respond_to :html
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = t('flash.category', message: t('flash.created'))
    end
    respond_to do |format|
      format.json { render :json => @category}
    end
  end

end
