class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find_by(id: params[:id])
  end

  def new
  end

  def create
    open_order = current_user.orders.find_by(status: "aberto")
    if open_order == nil
      open_order = Order.new
      open_order.user_id = current_user.id
      open_order.status = "aberto"
      open_order.data = Date.today
      open_order.save
      @purchase = Purchase.new
      @purchase.order_id = open_order.id
      @purchase.item_id = params[:item_id]
      @purchase.quantidade = params[:quantidade]
      @purchase.save
    else
      purchase_open = open_order.purchases.find_by(item_id: params[:item_id])
      if purchase_open == nil
        @purchase = Purchase.new
        @purchase.order_id = open_order.id
        @purchase.item_id = params[:item_id]
        @purchase.quantidade = params[:quantidade]
        @purchase.save
      else
        @purchase = purchase_open
        @purchase.order_id = open_order.id
        @purchase.item_id = params[:item_id]
        @purchase.quantidade = params[:quantidade]
        @purchase.save
      end
    end

    if @purchase.quantidade ==0
          @purchase.destroy
    end
    if @purchase.quantidade == nil
          @purchase.destroy
    end

    @item_chosen = Item.find_by(id: params[:item_id])

    if
      redirect_to category_search_url(secao: @item_chosen.secao_id ), notice: "Purchase created successfully."
    else
      render 'new'
    end
  end

  def edit
    @purchase = Purchase.find_by(id: params[:id])
  end

  def update

    @purchase = Purchase.find_by(id: params[:id])
    @purchase.order_id =params[:order_id]
    @purchase.item_id = params[:item_id]
    @purchase.quantidade = params[:quantidade]

    if @purchase.quantidade ==0
          @purchase.destroy
    end

    if @purchase.save
      redirect_to order_url(@purchase.order_id), notice: "Purchase updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @purchase = Purchase.find_by(id: params[:id])
    @purchase.destroy

    redirect_to order_url(@purchase.order_id), notice: "Purchase deleted."
  end
end
