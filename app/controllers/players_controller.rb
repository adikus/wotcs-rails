class PlayersController < ApplicationController

  def show
    @player = Player.find params[:id]
    @clan = @player.clan
  end

end
