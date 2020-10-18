class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group_savings = @group.savings.ordered_by_most_recent
  end

  # GET /groups/new
  def new
    @group = Group.new
  end
  # GET /groups/1/edit
  def edit
  end
  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }