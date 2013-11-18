class ClansController < ApplicationController

  def index
    @clans = Clan.in_region(1).order(tag: :asc).page(params[:page])
  end

  def show
    @clan = Clan.find params[:id]
    @players = @clan.players
  end

end
