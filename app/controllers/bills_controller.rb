class BillsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def new
    @bill = Bill.new
  end
  def create
    @user = current_user
    @bill = @user.bills.build(bill_params)
    if @bill.save
      redirect_to root_url, :notice => "Bill created!"
    else
      redirect_to root_url, :notice => "Bill not Created!"
    end
  end

  def destroy
    @bill.destroy
    redirect_to root_url
  end

    def bill_params
      params.require(:bill).permit(:for, :amount, :user_id)
    end

    def correct_user
      @bill = current_user.bills
      redirect_to root_url if @bill.nil?
    end

    def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

   def current_user?(user)
    user == current_user
  end
end