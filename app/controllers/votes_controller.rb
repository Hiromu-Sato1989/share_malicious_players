# frozen_string_literal: true

class VotesController < ApplicationController
  def create
    # 投票時にどのファイターか探す
    @fighter = Fighter.find(params[:fighter_id])
    # すでに投票していないかを探す
    alreadyvote = Vote.find_by(ip: request.remote_ip, fighter_id: params[:fighter_id])
    # 投票数に1を足す処理。非同期で投票数が動くようにするため
    new_vote_balance = @fighter.votes_count + 1
    # 見た目だけ加工してDBには保存しない
    @fighter.assign_attributes(votes_count: new_vote_balance)
    # 実際に投票が行われDBに保存される。リダイレクトすると投票数が1増えている
    Vote.create(fighter_id: params[:fighter_id], ip: request.remote_ip) unless alreadyvote
  end
end
