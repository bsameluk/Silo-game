class PlayersController < ApplicationController
  def toggle_attribute
    @game = Game.find(params[:game_id])
    @player = @game.players.find(params[:id])
    attribute = params[:attribute]
    
    # Проверяем, что атрибут разрешен для переключения
    allowed_attributes = ['bio_info', 'health_status', 'character', 'hobbies', 'knowledge', 'inventory']
    
    if allowed_attributes.include?(attribute)
      toggle_field = "is_show_#{attribute}"
      current_value = @player.send(toggle_field)
      @player.update(toggle_field => !current_value)
      
      respond_to do |format|
        format.html { redirect_to player_game_path(@game, player_id: @player.id) }
        format.json { render json: { success: true } }
      end
    else
      respond_to do |format|
        format.html { redirect_to player_game_path(@game, player_id: @player.id), alert: 'Недопустимый атрибут' }
        format.json { render json: { success: false, error: 'Недопустимый атрибут' }, status: :bad_request }
      end
    end
  end
end 