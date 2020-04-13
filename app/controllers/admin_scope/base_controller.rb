module AdminScope
  class BaseController < ApplicationController
    respond_to :html
    before_action :authenticate_user!

    layout "admin"
  end
end
