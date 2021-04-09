# frozen_string_literal: true

class FightersController < ApplicationController
  def index
    @fighters = Fighter.all
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      redirect_to root_path, success: '悪質プレイヤーを登録しました'
    else
      render :new
    end
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  private

  def fighter_params
    params.require(:fighter).permit(:name, :league_id, character_ids: [])
  end
end
