class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = Current.user

  puts "Current.user = #{Current.user.inspect}"

  if @group.save
    @group.group_users.create(user: Current.user)
    redirect_to group_path(@group)
  else
    puts @group.errors.full_messages
    render :new, status: :unprocessable_entity
  end
end

  def index
    @groups = Group.all
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :name,
      :introduction,
      :image
    )
  end
end