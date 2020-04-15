class FriendshipsController < ApplicationController
  # GET /friendships
  # GET /friendships.json
  def index
    @users = User.all
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to friendships_path, notice: @friendship.user.email.concat(" Has Been Added Successfully") }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_path, notice: @friendship.user.email.concat(" Has Been Destroyed")  }
      format.json { head :no_content }
    end
  end

  def add_friend_by_name
    @added_user = User.find_by(email: params[:user_email])
    if @added_user
      if !current_user.friends.include? @added_user
        @friendship = current_user.friendships.build(:friend_id => @added_user.id)
        @friendship.save
        redirect_to friendships_path, notice: @added_user.email.concat(" Has Been Added Successfully")
      else
        redirect_to friendships_path, notice: "Sorry This User Already Exist"
      end
    else
      redirect_to friendships_path, notice: "Sorry User Not Exist"
    end
  end
end
