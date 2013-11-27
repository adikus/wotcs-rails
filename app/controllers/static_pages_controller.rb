class StaticPagesController < ApplicationController

  def index
  end

  def search
    is_int = params[:search] == params[:search].to_i.to_s
    @clans = Clan.in_region(current_region).where('name ~* :s OR tag ~* :s'+(is_int ? ' OR id = :s' : ''), s: params[:search]).order(tag: :asc).page(params[:page])
  end

end
