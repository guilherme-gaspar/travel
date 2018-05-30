module ApplicationHelper

  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

  def period_day(period)
    @weeks = Week.all
    if(Date.today.wday == 1)
      @weeks.where(mond: period).count
    elsif (Date.today.wday == 2)
      @weeks.where(tues: period).count
    elsif (Date.today.wday == 3)
      @weeks.where(wedn: period).count
    elsif (Date.today.wday == 4)
      @weeks.where(thur: period).count
    elsif (Date.today.wday == 5)
      @weeks.where(frid: period).count
    elsif (Date.today.wday == 6)
      @weeks.where(satu: period).count
    end
  end

end
