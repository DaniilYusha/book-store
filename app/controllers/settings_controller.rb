class SettingsController < ApplicationController
  def index
    @presenter = SettingsPresenter.new(current_user)
  end
end
