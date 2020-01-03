class ItemsController < ApplicationController
  before_action :common_breadcrumbs

  def index
    @q = Item.ransack(params[:q])
    @q.sorts = "brand_name asc" if @q.sorts.empty?
    @items = @q.result.page(params[:page])
    authorize @items
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
    add_breadcrumb @item.name, @item
  end

  def new
    @item = current_user.items.new
    add_breadcrumb "New", [:new, :item]
    authorize @item
  end

  def edit
    @item = Item.find(params[:id])
    add_breadcrumb @item.name, @item
    add_breadcrumb "Edit", [:edit, @item]
    authorize @item
  end

  def create
    @item = current_user.items.new(item_params)
    authorize @item

    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    authorize @item

    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    authorize @item

    @item.destroy
    redirect_to :items
  end

  def destroy_image
    @item = current_user.items.find(params[:id])
    authorize @item

    @item.images.find_by_id(params[:image_id]).purge
    redirect_to [:edit, @item]
  end

  private

  def common_breadcrumbs
    add_breadcrumb Item.model_name.human.pluralize, items_url
  end

  def item_params
    params.
      require(:item).
      permit(:category_id,
             :brand_id,
             :name,
             :description,
             :year,
             :model_number,
             :serial_number,
             :authenticity,
             :location,
             :aasm_state,
             images: []
      )
  end
end
