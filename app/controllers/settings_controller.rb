class SettingsController < ApplicationController
  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(setting_params)
      redirect_to admin_url
    else
      render 'edit'
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:message, :background, :title)
  end
end
