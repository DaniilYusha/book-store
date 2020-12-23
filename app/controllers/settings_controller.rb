class SettingsController < ApplicationController
  def index
    @presenter = SettingsPresenter.new(user: current_user)
  end
end
