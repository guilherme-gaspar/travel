module ApplicationHelper

  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

  def period_day(period)
    @weeks = Week.joins(:user).where("users.admin_id = ?", current_admin.id)
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
      User.where(admin_id: current_admin.id).joins(:week).where(:weeks => {mond: period})
    elsif (Date.today.wday == 2)
      User.where(admin_id: current_admin.id).joins(:week).where(:weeks => {tues: period})
    elsif (Date.today.wday == 3)
      User.where(admin_id: current_admin.id).joins(:week).where(:weeks => {wedn: period})
    elsif (Date.today.wday == 4)
      User.where(admin_id: current_admin.id).joins(:week).where(:weeks => {thur: period})
    elsif (Date.today.wday == 5)
      User.where(admin_id: current_admin.id).joins(:week).where(:weeks => {frid: period})
    elsif (Date.today.wday == 6)
      User.where(admin_id: current_admin.id).joins(:week).where(:weeks => {satu: period})
    elsif (Date.today.wday == 0)
      []
    end
  end

  def name_controller_described(controller)
    if controller == "backoffice/admins/users"
      "- Painel administrativo de usuários"
    elsif controller == "backoffice/admins/dashboard"
      "- Dashboard"
    elsif controller == "backoffice/admins/fast_travels"
      "- Painel administrativo de viagens rápidas"
    elsif controller == "backoffice/admins/routes"
      "- Painel administrativo de rotas universitárias"
    elsif controller == "backoffice/admins/universities"
      "- Painel administrativo de universidades"
    elsif controller == "backoffice/admins/cars"
      "- Painel administrativo de carros"
    elsif controller == "backoffice/admins/drivers"
      "- Painel administrativo de motoristas"
    elsif controller == "backoffice/admins/finances"
      "- Painel administrativo do financeiro"
    elsif controller == "backoffice/admins/notifications"
      "- Painel administrativo de notificações"
    elsif controller == "backoffice/admins/profile"
      "- Configuração do perfil do gestor"
    elsif controller == "backoffice/admins/settings"
      "- Configurações do sistema"
    elsif controller == "backoffice/admins/reports"
      "- Painel administrativo de relatórios"
    end
  end
  
  def select_settings
    Setting.where("admin_id = ?", current_admin.id).pluck(:origin)
  end



end
