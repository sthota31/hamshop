class ReceiptsController < ApplicationController
  before_filter :require_authantication
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  layout "admin"


  def index
    @receipts = current_account.receipts.all
  end


  def show
  end

  def new
    @receipt = Receipt.new
  end

  def edit
  end

  
  def create
    params.permit!
    @receipt = Receipt.new(receipt_params)
    product_with_quantity_hash=[]
    respond_to do |format|
    if @receipt.save
      product_with_qty= {:pid=>params[:add_id], :qty=>params[:add_qty]}
       product_with_quantity_hash << product_with_qty
      if(params[:qty] and params[:qty].size > 0)
        params[:qty].each_with_index do |q,id| 
          product_with_quantity = {}
          product_with_quantity[:pid]= params[:name][id]
          product_with_quantity[:qty] = q
          product_with_quantity_hash << product_with_quantity
      end
    end
       @receipt.product_data(product_with_quantity_hash,current_user, current_account)
       

        format.html { redirect_to @receipt, notice: 'Receipt was successfully created.' }
        format.json { render action: 'show', status: :created, location: @receipt }
      else
        format.html { render action: 'new' }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      params.permit!
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  
 
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params[:receipt]
    end
end
