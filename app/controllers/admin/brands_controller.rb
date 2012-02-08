class Admin::BrandsController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @brand = flash[:brand] || Brand.new
  end

  def create
    update_or_create(Brand.new params[:brand])
  end

  def edit
    @brand = Brand.find_by_id! params[:id]
  end

  def update
    update_or_create(Brand.find_by_id! params[:id])
  end

  private
  def update_or_create(brand)
    if brand.save
      flash.discard :brand
    else
      flash[:brand] = brand
    end

    redirect_to new_admin_brand_path
  end
end
