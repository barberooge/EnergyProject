class CompaniesController < ApplicationController
      before_action :logged_in_user, only: [:index, :edit, :update, :show]
      before_action :correct_user,   only: [:edit, :update]

  def index
      @companies = Company.all
  end

  def new
      @company = Company.new
  end

  def create
      @company = Company.new(company_params)
    if @company.save
      # Handle a successful save.
      flash[:success] = "Company created!"
      redirect_to @company
    else
      render 'new'
    end
  end

  def edit
      @company = Company.find(params[:id])
  end

  def update
      @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      # Handle a successful update.
      flash[:success] = "Company updated"
      redirect_to @company
    else
      render 'edit'
    end
  end

  def show
      @company = Company.find(params[:id])
  end

  private

  def company_params
      params.require(:company).permit(:name, :siret)
  end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
