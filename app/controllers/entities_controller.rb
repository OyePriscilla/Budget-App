class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index
    @group = current_user.groups.find(params[:group_id])
  end

  # GET /entities/new
  def new
    @group = Group.find(params[:group_id])
    @entity = Entity.new
  end

   # POST /entities or /entities.json
  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.new(entity_params)

    if @entity.save
      flash[:notice] = 'Transaction is completed'
      redirect_to group_entities_path(@category)
    else
      flash[:notice] = 'Invalid Transaction!'
    end
  end


  private

   # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :user_id)
  end
end
