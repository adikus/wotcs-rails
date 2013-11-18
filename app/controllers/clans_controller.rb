class ClansController < ApplicationController

  def index
    @clans = Clan.in_region(1).order(tag: :asc).limit(40)
  end

  def show
    @clan = Clan.find params[:id]
    @players = @clan.players
  end

end
