class ListsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = "List created!"
    else
      flash[:danger] = "Could not create list, make sure you gave the list a title"
    end
      redirect_to current_user
  end

  def edit
    binding.pry
  end

  def destroy
    @list.destroy
    flash[:success] = 'List destroyed!'
    redirect_to current_user
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end

    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_url if @list.nil?
    end
end
