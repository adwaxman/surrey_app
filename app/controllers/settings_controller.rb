class SettingsController < ApplicationController
  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(setting_params)
      flash[:alert] = "Your changes are in effect."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:message, :background, :title, :nav, :container, :cardt, :cardbuttontext, :cardpanel)
  end
end
