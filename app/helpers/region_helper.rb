module RegionHelper

  def default_region
    1
  end

  def current_region
    @current_region || get_current_region
  end

  def current_region=(region)
    @current_region = region
  end

  def get_current_region
    @current_region = cookies[:region].to_i || set_current_region(default_region)
  end

  def set_current_region(region)
    cookies[:region] = {
        value: region,
        expires: 1.year.from_now
    }
  end

  def all_regions
    [0,1,2,3,5]
  end

  def all_regions_translated
    ['RU', 'EU', 'NA', 'SEA','VN', 'KR']
  end

  def all_regions_except_current
    all_regions.select { |r|  r!= current_region }
  end

  def current_region_translated
    all_regions_translated[current_region]
  end

end
