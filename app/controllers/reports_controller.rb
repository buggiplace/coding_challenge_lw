class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def handle
    p request.headers["X-Server-CodeName"]
    p request.headers["X-Server-Token"]
    render json: { message: "testing" }
  end

  def authenticate_server
    # before_action :authenticate_server
    code_name = request.headers["X-Server-CodeName"]
    server = Server.find_by(code_name: code_name)
    access_token = headers["X-Server-Token"]
    unless server.access_token == access_token
      render json: { message: "Wrong credentials" }
    end
  end
end
