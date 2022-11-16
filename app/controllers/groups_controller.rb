class GroupsController < ApplicationController
  before_action :authenticate_user!

  # GET /groups or /groups.json
  def index
    @groups = current_user.groups
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      flash[:notice] = 'Group is successfully created'
      redirect_to groups_path
    else
      flash[:notice] = 'Invalid Entry'
      redirect_to new_group_path
    end
  end

  private

   # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
