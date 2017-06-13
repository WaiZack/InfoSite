class SlavesController < ApplicationController
  def new
    @slave = Slave.new
  end

  def create
    @slave = Slave.new(slaves_param)
    if @slave.save
      redirect_to '/volunteerDone'
    else
      render 'new'
    end


  end

  def slaves_param
    params.require(:slave).permit(:name, :email, :institute, :diet, :phone,:morning,:afternoon,:morning2,:afternoon2)
  end
end
