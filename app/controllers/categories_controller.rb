class CategoriesController < ApplicationController
  before_action :common_breadcrumbs

  def index
    @q = Category.ransack(params[:q])
    @q.sorts = "name ASC" if @q.sorts.empty?
    @categories = @q.result(distinct: true).page(params[:page])
    authorize @categories
  end

  def show
    @category = Category.find(params[:id])
    authorize @category
    add_breadcrumb @category.name, @category
  end

  def new
    @category = Category.new
    add_breadcrumb "New", [:new, :category]
    authorize @category
  end

  def edit
    @category = Category.find(params[:id])
    add_breadcrumb @category.name, @category
    add_breadcrumb "Edit", [:edit, @category]
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to :categories
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    authorize @category

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category

    @category.destroy
    redirect_to :categories
  end


  private

  def common_breadcrumbs
    add_breadcrumb Category.model_name.human.pluralize, categories_url
  end

  def category_params
    params.
      require(:category).permit(:name)
  end
end
