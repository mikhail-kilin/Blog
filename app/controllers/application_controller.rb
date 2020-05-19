class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def check_policy(path, arg)
    action_name = params[:action]

    policy = send(model_name + "_policy")

    result_path = if arg
      send(path, send(arg))
    else
      send path
    end

    redirect_to result_path and return unless policy.send("#{action_name}?")
  end

  def model_name
    controller_name = params[:controller].split("/").last
    controller_name.split("_").first.singularize
  end
end
