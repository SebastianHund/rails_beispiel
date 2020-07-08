class AccountsController < ApplicationController
  def index
    @accounts = Account.order(:name)
  end

  def new
    @account = Account.new(name: "Bitte gib mir einen Namen", email: "test@example.com")
  end

  def create
    @account = Account.new(create_params)
    @account.save
    redirect_to accounts_path
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account.update(update_params)
    redirect_to accounts_path
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private

  def create_params
    params.require(:account).permit(:email, :name)
  end

  alias_method :update_params, :create_params
end
