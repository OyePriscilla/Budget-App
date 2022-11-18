class EntitiesController < ApplicationController
  def index
    @group = current_user.groups.find_by(id: params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @group = Group.find_by(id: params[:group_id])
    @entity = Entity.new
  end

  def create
    @group = Group.find_by(id: params[:group_id])
    @entity = @group.entities.new(name: entity_params[:name],
                                  amount: entity_params[:amount], user_id: current_user.id)
    if @entity.save
      flash[:notice] = 'Transaction is completed'
      redirect_to group_entities_path(@group)
    else
      flash[:notice] = 'Invalid entity!'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
