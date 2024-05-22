# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    render json: Job.includes(:events, applications: :events)
  end
end
