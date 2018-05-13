class Backoffice::Admins::UniversitiesController < Backoffice::AdminsController
  def index
    @universities = University.all.page(params[:page]).per(7)
  end
end
