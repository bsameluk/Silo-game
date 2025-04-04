class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new({
      name: params[:game][:name],
      max_players: params[:game][:max_players],
    })
    if @game.save
      redirect_to @game, notice: 'Игра успешно создана'
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def join_form
    @game = Game.find(params[:id])
    render :join_form
  end

  def join
    @game = Game.find(params[:id])
    
    if @game.players.count >= @game.max_players
      redirect_to @game, alert: 'Игра уже заполнена'
      return
    end
    
    existing_player = @game.players.find_by(name: params[:player][:name])
    
    if existing_player
      redirect_to player_game_path(@game, player_id: existing_player.id), 
                  notice: 'Вы уже участвуете в этой игре'
      return
    end
    
    player = Player.new(
      name: params[:player][:name],
      game: @game
    )
    
    if player.save
      generate_player_attributes(player)
      redirect_to player_game_path(@game, player_id: player.id), 
                  notice: 'Вы успешно присоединились к игре'
    else
      flash.now[:alert] = 'Ошибка при присоединении к игре'
      render :join_form
    end
  end

  def show_for_player
    @game = Game.find(params[:id])
    @current_player = @game.players.find(params[:player_id])
    render :show_for_player
  end

  private

  def generate_player_attributes(player)
    player.update(
      bio_info: PlayerAttribute.where(attr_type: PlayerAttribute::AttributeTypes::BIO_INFO).sample.content,
      health_status: PlayerAttribute.where(attr_type: PlayerAttribute::AttributeTypes::HEALTH_STATUS).sample.content,
      character: PlayerAttribute.where(attr_type: PlayerAttribute::AttributeTypes::CHARACTER).sample.content,
      hobbies: PlayerAttribute.where(attr_type: PlayerAttribute::AttributeTypes::HOBBIES).sample.content,
      knowledge: PlayerAttribute.where(attr_type: PlayerAttribute::AttributeTypes::KNOWLEDGE).sample.content,
      inventory: PlayerAttribute.where(attr_type: PlayerAttribute::AttributeTypes::INVENTORY).sample.content,
      is_show_bio_info: false,
      is_show_health_status: false,
      is_show_character: false,
      is_show_hobbies: false,
      is_show_knowledge: false,
      is_show_inventory: false,
      is_show_additional_info: false
    )
  end

  def game_params
    params.require(:game).permit(:name, :max_players) # добавьте нужные параметры
  end
end
