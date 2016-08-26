class TeamController < ApplicationController
  def index
  	# @team = Team.where(game:session[:game])
    @team = Team.where(game_id:params[:id])
   
  end

  def show
    @teams = Team.where(game_id:params[:id])

  end

  def update
  	@team = Team.find(params[:id])
  	is_valid = @team.update(name:params[:name])
  	if is_valid
  		redirect_to "/game/#{@team.game_id}"
  	else
  		flash[:errors] = @team.errors.full_messages
  		redirect_to "/team/#{@team.game_id}"
  	end
  end

  def points
  	session[:total_points] = 0 unless session.has_key? :total_points
    team = Team.find(params[:id])
    points = params[:points].to_i
    if team.total_points == nil
      totalpoints= session[:total_points] +points
    else
      totalpoints = team.total_points.to_i + points
    end
    is_valid = team.update(total_points: totalpoints)
    if is_valid
      session[:total_points]=nil
  		redirect_to "/game/#{team.game_id}"
  	else
  		flash[:errors] = team.errors.full_messages
  		redirect_to "/team/#{team.game_id}"
  	end
  end

  def destroy
  	@member = Member.find_by(team_id:params[:team_id], user:current_user)
  	@member.destroy
	redirect_to "/team/#{@member.game_id}"
  end

  def create
    if session.has_key? :game
  	 @member = Member.new(user:current_user, team_id:params[:team_id], game_id:session[:game])
        if @member.valid? 
          @member.save
          session[:game]=nil
          redirect_to "/game/#{@member.game_id}"
        else
          flash[:errors]=@member.errors.full_messages
           session[:game]=nil
          redirect_to "/team/#{@member.game_id}"
        end
    else
      @change_member = Member.new(user:current_user, team_id:params[:team_id], game_id:params[:id])
      puts @change_member
      puts params[:id]
        if @change_member.valid?
          @change_member.save
      	  redirect_to "/game/#{params[:id]}"
        else
        	flash[:errors]=@change_member.errors.full_messages
        	redirect_to "/team/#{params[:id]}"
        end
      end
    end
  end
