class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :check_login

  def index
    @user = User.find(session[:user_id])
    @groups = Group.ordered_by_name
  end

  def show
    @group_savings = @group.savings.includes(:groupedsavings, :groups, :author).ordered_by_most_recent
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
      else
        format.html { redirect_to new_group_path, alert: @group.errors.full_messages }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @group.destroy
        format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      else
        format.html { redirect_to groups_url, notice: "Group couldn't be destroyed." }
      end
    end
  end

  private

  def set_group
    @group = Group.includes(:creator).find(params[:id])
  end

  def group_params
    params.require(:group).permit(:creator_id, :name, :icon)
  end

  def check_login
    redirect_to root_path if session[:user_name].nil?
  end
end
