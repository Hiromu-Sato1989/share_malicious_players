# frozen_string_literal: true

class FightersController < ApplicationController
  # アクセスごとにPV数を増やしたい場合
  impressionist actions: [:show]
  # 同IPアドレスで1回だけ計測する場合
  # impressionist actions: [:show], unique: %i[impressionable_id ip_address]
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
      redirect_to @fighter, success: '悪質プレイヤーを登録しました'
    else
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
  end

  def show
    # ファイターが閲覧者のIPアドレスに紐づく投票を持ってるか探す
    @voted_ip = @fighter.votes.find_by(ip: request.remote_ip)&.ip
    @comment = Comment.new
    @comments = @fighter.comments.includes(:user).order(created_at: :asc)
  end

  def edit; end

  def update
    if @fighter.update(fighter_edit_params)
      # updated_atを現在時刻に更新する
      @fighter.touch(:updated_at) # rubocop:disable Rails/SkipsModelValidations
      redirect_to @fighter, success: 'プレイヤーデータを更新しました'
    else
      flash.now[:danger] = '入力内容に誤りがあります'
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
