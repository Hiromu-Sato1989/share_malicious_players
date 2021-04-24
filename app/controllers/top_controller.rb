# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @fighters = Fighter.all.order(votes_count: :desc).limit(5)
    @votes = Vote.all
  end
end
