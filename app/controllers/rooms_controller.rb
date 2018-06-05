class RoomsController < ApplicationController

  before_action :authenticate_member!

  def index
    @rooms = Room.all
  end

  def show

  end

  def new
    @room = Room.new
    # @room = current_member.build
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, notice: "Successfully created new Room"
    else
      render 'new'
    end
  end

  def edit
    @member = current_member
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Room was Successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private
  
  def room_params
    params.require(:room).permit(:name, :description, :price, :facilitites, :location)
  end

end
