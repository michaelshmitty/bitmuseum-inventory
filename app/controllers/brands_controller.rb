class BrandsController < ApplicationController
  before_action :common_breadcrumbs

  def index
    @q = Brand.ransack(params[:q])
    @q.sorts = "name ASC" if @q.sorts.empty?
    @brands = @q.result(distinct: true).page(params[:page])
    authorize @brands
  end

  def show
    @brand = Brand.find(params[:id])
    authorize @brand
    add_breadcrumb @brand.name, @brand
  end

  def new
    @brand = Brand.new
    add_breadcrumb "New", [:new, :brand]
    authorize @brand
  end

  def edit
    @brand = Brand.find(params[:id])
    add_breadcrumb @brand.name, @brand
    add_breadcrumb "Edit", [:edit, @brand]
    authorize @brand
  end

  def create
    @brand = Brand.new(brand_params)
    authorize @brand

    if @brand.save
      redirect_to @brand
    else
      render :new
    end
  end

  def update
    @brand = Brand.find(params[:id])
    authorize @brand

    if @brand.update(brand_params)
      redirect_to @brand
    else
      render :edit
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    authorize @brand

    @brand.destroy
    redirect_to :brands
  end


  private

  def common_breadcrumbs
    add_breadcrumb Brand.model_name.human.pluralize, brands_url
  end

  def brand_params
    params.
      require(:brand).permit(:name)
  end
end
