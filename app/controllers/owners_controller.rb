class OwnersController < ApplicationController
  before_action :common_breadcrumbs

  def index
    @q = Owner.ransack(params[:q])
    @q.sorts = "name ASC" if @q.sorts.empty?
    @owners = @q.result(distinct: true).page(params[:page])
    authorize @owners
  end

  def show
    @owner = Owner.find(params[:id])
    authorize @owner
    add_breadcrumb @owner.name, @owner
  end

  def new
    @owner = Owner.new
    add_breadcrumb "New", [:new, :owner]
    authorize @owner
  end

  def edit
    @owner = Owner.find(params[:id])
    add_breadcrumb @owner.name, @owner
    add_breadcrumb "Edit", [:edit, @owner]
    authorize @owner
  end

  def create
    @owner = Owner.new(owner_params)
    authorize @owner

    if @owner.save
      redirect_to :owners
    else
      render :new
    end
  end

  def update
    @owner = Owner.find(params[:id])
    authorize @owner

    if @owner.update(owner_params)
      redirect_to @owner
    else
      render :edit
    end
  end

  def destroy
    @owner = Owner.find(params[:id])
    authorize @owner

    @owner.destroy
    redirect_to :owners
  end


  private

  def common_breadcrumbs
    add_breadcrumb Owner.model_name.human.pluralize, owners_url
  end

  def owner_params
    params.
      require(:owner).permit(:name, :contact_information)
  end
end
