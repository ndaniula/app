class EmergencyContactsController < ApplicationController
  before_action :authenticate_user!


  def index
    @emergency_contacts = EmergencyContact.where(user: current_user)
  end

  def show
    @user = current_user
    @emergency_contact = EmergencyContact.find(params[:id])
  end

  def new
    @emergency_contact = EmergencyContact.new
    @user = current_user
  end

  def create
    @emergency_contact = EmergencyContact.new(emcon_params)
    @user = current_user
    @emergency_contact.user = @user
    if @emergency_contact.save
      redirect_to dashboard_path, notice: 'Successfully created a new emergency contact.'
    else
      render :new
    end
  end

  def edit
    @emergency_contact = EmergencyContact.find(params[:id])
    @user = current_user
  end

  def update
    @emergency_contact = EmergencyContact.find(params[:id])
    if @emergency_contact.update(emcon_params)
      redirect_to root_path, notice: 'Successfully updtaed the emergency contact.'
    else
      render :edit
    end
  end

  def destroy
    @emergency_contact = EmergencyContact.find(params[:id])
    if @emergency_contact.destroy
      redirect_to dashboard_path, notice: 'Successfully deleted a new emergency contact.'
    end
  end

end

  private

    def emcon_params
      params.require(:emergency_contact).permit(:first_name, :last_name, :phone_number)
    end


