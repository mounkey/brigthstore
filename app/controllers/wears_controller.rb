class WearsController < ApplicationController
  before_action :set_wear, only: [:destroy, :show, :update, :edit]
def index
  @wears = Wear.all
end
def show
end
