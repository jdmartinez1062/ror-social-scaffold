class FriendshipsController < ApplicationController
  require 'will_paginate/array'

  before_action :actual_user
  # method that gives the list of friend requests send to the user
  def requests
    @requests = @user.request_list.paginate(page: params[:page], per_page: 30)
  end

  # method that gives the list of friend requests that the user has sent
  def pending
    @pendings = @user.pending_list.paginate(page: params[:page], per_page: 30)
  end

  def status
    friend_relation = @user.inverse_friendship.find_by(user_id: params[:id])
    friend_relation.status = true
    friend_relation.save
    redirect_to root_path
  end

  def friendship_delete
    friend_relation = @user.inverse_friendship.find_by(user_id: params[:id]).destroy
    redirect_to requests_path
  end

  private

  def actual_user
    @user = current_user
  end
end
