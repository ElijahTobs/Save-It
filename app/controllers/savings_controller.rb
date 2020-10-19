class SavingsController < ApplicationController
  before_action :set_saving, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(session[:user_id])
    @savings = @user.savings.all.ordered_by_most_recent
  end

  def show
    
  end

  def new
    @saving = Saving.new
    @group = params[:group]
  end

  def edit
    
  end

  def create
    @saving = Saving.new(saving_params)

    respond_to do |format|
      if @saving.save
        unless group_param[:group_id].to_i.zero?
          Groupedtransaction.create(saving_id: @saving.id, group_id: group_param[:group_id])
        end
        format.html { redirect_to savings_path, notice: 'Saving was successfully created.' }
        format.json { render :show, status: :created, location: @saving }
      else
        format.html { redirect_to "/saving  s/new/#{group_param[:group_id]}", alert: 'All the fields must be filled' }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|

      if @saving.update(saving_params)
        format.html { redirect_to @saving, notice: 'Saving was successfully updated.' }
        format.json { render :show, status: :ok, location: @saving }
      else
        format.html { render :edit }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @saving.destroy
    respond_to do |format|

      format.html { redirect_to savings_url, notice: 'Saving was successfully destroyed.' }
      format.json { head :no_content }
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
    params.require(:expense).permit(:group_id)
  end
end
