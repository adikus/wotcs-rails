class Clan < ActiveRecord::Base
  default_scope { where('status > 0') }

  has_many :players

  scope :in_region, ->(region) do
    if region == 0
      where('id < 500000000')
    elsif region == 1
      where('id > 500000000 AND id < 1000000000')
    elsif region == 2
      where('id > 1000000000 AND id < 2000000000')
    elsif region == 3
      where('id > 2000000000 AND id < 2500000000')
    elsif region == 4
      where('id > 2500000000 AND id < 3000000000')
    elsif region == 5
      where('id > 3000000000')
    end
  end

  def domain
    return 'worldoftanks.kr' if id > 3000000000
    return 'portal-wot.go.vn' if id > 2500000000
    return 'worldoftanks.asia' if id > 2000000000
    return 'worldoftanks.com' if id > 1000000000
    return 'worldoftanks.eu' if id > 500000000
    return 'worldoftanks.ru'
  end

  def emblem
    "http://clans.#{self.domain}/media/clans/emblems/clans_#{self.id.to_s[0]}/#{self.id}/emblem_32x32.png"
  end

end