class GameController < ApplicationController
  def index
  	@user=current_user
	loggedin?
  end

  def new 
	

  end

  def create
  	@game = Game.new(name:params[:name], num_of_players:params[:num_of_players], num_of_bars:params[:num_of_bars], date_time: params[:date_time])
  	gameparticipation=Gameparticipation.new(user:current_user, game:@game)
    places = Place.all.sample(@game.num_of_bars)
  	challenges = Challenge.all.sample(@game.num_of_bars)
  	
    places.each do |place|
      place= Placegame.create(place:place,game:@game,challenge:challenges.pop)
  		@options = Challengeoption.where(challenge_id:challenges)
  	end

    @num_team = @game.num_of_players
    for i in (1..@num_team)
      team = Team.create(game:@game)
      session[:game]= @game.id
    end

  	if @game.valid?
  		@game.save
      gameparticipation.save
  		redirect_to "/game/#{@game.id}"
  	else
  		flash[:errors] = @game.errors.full_messages
  		redirect_to "/game/new"
  	end
  end

  def show
  	@game = Game.find_by(id:params[:id]) 
    if  @game !=nil
      @team = Member.find_by(user:current_user,team:Team.where(game:@game))
      @all_team = Member.where(team:Team.where(game:@game))

      if @team == nil
        session[:game] = @game.id
        redirect_to "/team/#{@game.id}"

      end
    	@current_time = Time.new.strftime("%b-%d-%Y %I:%M %p")
    	@current = Time.new
    	# @place= Placegame.where(game:@game)
    	@places= Place.all
    	@challenges= Challenge.all

      @timer= @game.date_time.strftime("%I:%M %p").to_i+1

 
  	else
      flash[:errors]=["I'm sorry, we couldn't find a pub crawl with that ID"]
      redirect_to "/game"
      return
    end
  end

end
