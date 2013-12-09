class PagesController < ApplicationController

  def pag_inicial
    render 'pag_inicial'
  end


  def pag_busca
    @open_order = current_user.orders.find_by(status: "aberto")

    render 'pag_busca'
  end

  def compras
    @closed_order = current_user.orders.where(status: "fechado")
    render 'compras'
  end


  def category_search
    if params[:secao] == ""
     redirect_to busca_url, notice: "Erro: Por favor, Selecione categoria"
    else
      @secao_choosen = Secao.find_by(id: params[:secao])
      @open_order = current_user.orders.find_by(status: "aberto")
          render 'category_search'
    end
  end

  def vercompra
    @order = Order.find_by(id: params[:id])
    open_order = current_user.orders.find_by(status: "aberto")
    if open_order == nil
      open_order = Order.new
      open_order.user_id = current_user.id
      open_order.status = "aberto"
      open_order.data = Date.today
      open_order.save
      @order.purchases.each do |velho_purchase|
        purchase = Purchase.new
        purchase.order_id = open_order.id
        purchase.item_id = velho_purchase.item_id
        purchase.quantidade = velho_purchase.quantidade
        purchase.save
      end
    else
      @order.purchases.each do |velho_purchase|
        purchase_open = open_order.purchases.find_by(item_id: velho_purchase.item_id)
        if purchase_open == nil
          purchase = Purchase.new
          purchase.order_id = open_order.id
          purchase.item_id = velho_purchase.item_id
          purchase.quantidade = velho_purchase.quantidade
          purchase.save
        else
          purchase = purchase_open
          purchase.order_id = open_order.id
          purchase.item_id = velho_purchase.item_id
          purchase.quantidade = velho_purchase.quantidade
          purchase.save
        end
      end
    end


        redirect_to order_url(id: open_order.id)

  end


  def cria_compra_com_antiga

  end

  def item_search
    @searched_word = Item.where("item LIKE ?", "%#{params[:word]}%")
    @word = params[:word]
    @open_order = current_user.orders.find_by(status: "aberto")
        render 'item_search'

  end


  def pag_sair
    @open_order = current_user.orders.find_by(status: "aberto")
    @total = 0
    @open_order.purchases.each do |purchase|
       @total = @total + purchase.item.preco * purchase.quantidade
    end
    @open_order.status = "fechado"
    @open_order.save
    render 'pag_sair'
  end


end
