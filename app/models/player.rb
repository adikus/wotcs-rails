class Player < ActiveRecord::Base
  default_scope { where('status > -1') }

  belongs_to :clan

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

end