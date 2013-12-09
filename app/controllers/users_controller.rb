class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.nome = params[:nome]
    @user.sobrenome = params[:sobrenome]
    @user.telefone = params[:telefone]
    @user.endereco = params[:endereco]
    @user.cidade = params[:cidade]
    @user.estado = params[:estado]
    @user.cep = params[:cep]

    if @user.save
      redirect_to users_url, notice: "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.nome = params[:nome]
    @user.sobrenome = params[:sobrenome]
    @user.telefone = params[:telefone]
    @user.endereco = params[:endereco]
    @user.cidade = params[:cidade]
    @user.estado = params[:estado]
    @user.cep = params[:cep]

    if @user.save
      redirect_to users_url, notice: "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to users_url, notice: "User deleted."
  end
end
