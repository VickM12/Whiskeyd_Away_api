class WelcomeController < ApplicationController
def index
  render json: { status: 200, message: "Whiskeys API" }
end
end
