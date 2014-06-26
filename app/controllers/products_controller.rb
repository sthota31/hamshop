class ProductsController < ApplicationController
  before_filter :require_authantication
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  layout "admin"


  def index
    @products = current_account.products.paginate(:include => :location,
    :page => params[:page], :per_page => 20, 
    :order => 'id DESC')
  end


  def show
  end

 
  def new
    @product = Product.new
  end

 
  def edit
  end


  def create
    params.permit!
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        @product.location_id = current_account.id
        @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
  
    respond_to do |format|
       params.permit!
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params[:product]
    end
end
