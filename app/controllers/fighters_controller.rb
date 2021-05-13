# frozen_string_literal: true

class FightersController < ApplicationController
  # アクセスごとにPV数を増やしたい場合
  # impressionist actions: [:show]
  before_action :set_fighter, only: %i[show edit update]

  def index
    @q = Fighter.ransack(params[:q])
    @fighters = @q.result(distinct: true)\
                  .includes([:league])\
                  .includes([:character])\
                  .order(name: :asc)
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      redirect_to fighters_path, success: '悪質プレイヤーを登録しました'
    else
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
  end

  def show
    @voted_ip = @fighter.votes.find_by(ip: request.remote_ip)&.ip
    # session_hashごとに計測する場合
    impressionist(@fighter, nil, unique: [:session_hash])
  end

  def edit; end

  def update
    if @fighter.update(fighter_edit_params)
      # 更新日時を現在時刻にする
      @fighter.touch
      redirect_to @fighter, success: '悪質プレイを更新しました'
    else
      flash.now[:danger] = '悪質プレイを選んでください'
      render :edit
    end
  end

  private

  def fighter_params
    # params.require(:fighter).permit(:name, :league_id, character_ids: [], category_ids: [])
    # 多対多の場合は上記
    params.require(:fighter).permit(:name, :league_id, :character_id, category_ids: [])
  end

  def fighter_edit_params
    params.require(:fighter).permit(:character_id, category_ids: [])
  end

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end
end
