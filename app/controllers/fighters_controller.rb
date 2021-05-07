# frozen_string_literal: true

class FightersController < ApplicationController
  def index
    @q = Fighter.ransack(params[:q])
    @fighters = @q.result(distinct: true)\
                  .includes([:league])\
                  .includes([:characters])\
                  .order(name: :asc)
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      redirect_to root_path, success: '悪質プレイヤーを登録しました'
    else
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
  end

  def show
    @fighter = Fighter.find(params[:id])
    @voted_ip = @fighter.votes.find_by(ip: request.remote_ip)&.ip
  end

  private

  def fighter_params
    params.require(:fighter).permit(:name, :league_id, character_ids: [], category_ids: [])
  end
end
