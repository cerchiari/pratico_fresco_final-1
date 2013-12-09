class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.secao_id = params[:secao_id]
    @item.subsecao_id = params[:subsecao_id]
    @item.item = params[:item]
    @item.marca = params[:marca]
    @item.descricao = params[:descricao]
    @item.preco = params[:preco]
    @item.imagem = params[:imagem]

    if @item.save
      redirect_to items_url, notice: "Item created successfully."
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.secao_id = params[:secao_id]
    @item.subsecao_id = params[:subsecao_id]
    @item.item = params[:item]
    @item.marca = params[:marca]
    @item.descricao = params[:descricao]
    @item.preco = params[:preco]
    @item.imagem = params[:imagem]

    if @item.save
      redirect_to items_url, notice: "Item updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy

    redirect_to items_url, notice: "Item deleted."
  end
end
