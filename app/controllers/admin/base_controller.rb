module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :admin_only!

    private

    def admin_only!
      redirect_to root_path unless current_user.admin? || current_user.stockist?
    end
  end
end