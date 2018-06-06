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
    elsif (Date.today.wday == 0)
      0
    end
  end

  def allocated(period)
    # .where("allocated = ?", 1)
    if(Date.today.wday == 1)
      User.joins(:week).where(:weeks => {mond: period})
    elsif (Date.today.wday == 2)
      User.joins(:week).where(:weeks => {tues: period})
    elsif (Date.today.wday == 3)
      User.joins(:week).where(:weeks => {wedn: period})
    elsif (Date.today.wday == 4)
      User.joins(:week).where(:weeks => {thur: period})
    elsif (Date.today.wday == 5)
      User.joins(:week).where(:weeks => {frid: period})
    elsif (Date.today.wday == 6)
      User.joins(:week).where(:weeks => {satu: period})
    elsif (Date.today.wday == 0)
      0
    end
  end



end
