class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def admin
  end

  def normy
  end
end
