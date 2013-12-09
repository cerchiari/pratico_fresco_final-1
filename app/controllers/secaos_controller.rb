class SecaosController < ApplicationController

  def index
    @secaos = Secao.all
  end

  def show
    @secao = Secao.find_by(id: params[:id])
  end

  def new
    @secao = Secao.new
  end

  def create
    @secao = Secao.new
    @secao.secao = params[:secao]

    if @secao.save
      redirect_to secaos_url, notice: "Secao created successfully."
    else
      render 'new'
    end
  end

  def edit
    @secao = Secao.find_by(id: params[:id])
  end

  def update
    @secao = Secao.find_by(id: params[:id])
    @secao.secao = params[:secao]

    if @secao.save
      redirect_to secaos_url, notice: "Secao updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @secao = Secao.find_by(id: params[:id])
    @secao.destroy

    redirect_to secaos_url, notice: "Secao deleted."
  end
end
