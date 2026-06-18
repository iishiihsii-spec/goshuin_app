class MapsController < ApplicationController
  before_action :authenticate_user!
  def index
    @goshuins = current_user.goshuins
  end
end
