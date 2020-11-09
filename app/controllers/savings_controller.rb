class SavingsController < ApplicationController
  before_action :set_saving, only: %i[show edit update destroy]
  before_action :check_login

  # GET /savings
  # GET /savings.json
  def my_external
    @user = User.includes(:savings, :groups).find(session[:user_id])
    @savings = @user.savings.includes(:groups, :author).stand_alone_savings.ordered_by_most_recent
    render 'index'
  end

  def index
    @user = User.includes(:savings, :groups).find(session[:user_id])
    @savings = @user.savings.includes(:groups, :author).ordered_by_most_recent
  end

  def show; end

  def new
    @saving = Saving.new
    @group = params[:group]
  end

  def create
    @saving = Saving.new(saving_params)
    respond_to do |format|
      if @saving.save
        Groupedsaving.create(saving_id: @saving.id, group_id: group_param[:group_id]) unless group_param[:group_id].to_i.zero?
        format.html { redirect_to savings_path, notice: 'Saving was successfully created.' }
      else
        format.html { redirect_to "/savings/new/#{group_param[:group_id]}", alert: @saving.errors.full_messages }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @saving.destroy
        format.html { redirect_to savings_url, notice: 'Saving was successfully deleted.' }
      else
        format.html { redirect_to savings_url, notice: "Saving couldn't be deleted." }
      end
    end
  end

  private

  def set_saving
    @saving = Saving.find(params[:id])
  end

  def saving_params
    params.require(:saving).permit(:author_id, :name, :amount)
  end

  def group_param
    params.require(:saving).permit(:group_id)
  end

  def check_login
    redirect_to root_path if session[:user_name].nil?
  end
end
