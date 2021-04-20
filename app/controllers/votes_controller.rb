# frozen_string_literal: true

class VotesController < ApplicationController
  def create
    @fighter = Fighter.find(params[:fighter_id])
    @alreadyvote = Vote.find_by(ip: request.remote_ip, fighter_id: params[:fighter_id])
    if @alreadyvote
      redirect_back fallback_location: root_path, danger: 'すでに投票しています'
    else
      @vote = Vote.create(fighter_id: params[:fighter_id], ip: request.remote_ip)
      redirect_back fallback_location: root_path, success: '投票しました！'
    end
  end
end
