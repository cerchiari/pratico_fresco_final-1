class SubsecaosController < ApplicationController

  def index
    @subsecaos = Subsecao.all
  end

  def show
    @subsecao = Subsecao.find_by(id: params[:id])
  end

  def new
    @subsecao = Subsecao.new
  end

  def create
    @subsecao = Subsecao.new
    @subsecao.secao_id = params[:secao_id]
    @subsecao.subsecao = params[:subsecao]

    if @subsecao.save
      redirect_to subsecaos_url, notice: "Subsecao created successfully."
    else
      render 'new'
    end
  end

  def edit
    @subsecao = Subsecao.find_by(id: params[:id])
  end

  def update
    @subsecao = Subsecao.find_by(id: params[:id])
    @subsecao.secao_id = params[:secao_id]
    @subsecao.subsecao = params[:subsecao]

    if @subsecao.save
      redirect_to subsecaos_url, notice: "Subsecao updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @subsecao = Subsecao.find_by(id: params[:id])
    @subsecao.destroy

    redirect_to subsecaos_url, notice: "Subsecao deleted."
  end
end
