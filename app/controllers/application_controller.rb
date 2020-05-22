class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def check_policy
    action_name = params[:action]

    policy = send(model_name + "_policy")

    redirect_to root_path and return unless policy.send("#{action_name}?")
  end

  def model_name
    controller_name = params[:controller].split("/").last
    controller_name.split("_").first.singularize
  end
end
