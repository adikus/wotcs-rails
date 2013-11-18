class ClansController < ApplicationController

  def index
    @clans = Clan.in_region(1).order(tag: :asc).page(params[:page])
    @nav_item = 'clans'
  end

  def show
    @clan = Clan.find params[:id]
    @players = @clan.players
  end

  def changes
    @clan = Clan.find params[:id]
    @js[:clan_id] = @clan.id
  end

end
