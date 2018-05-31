class Backoffice::Admins::UniversitiesController < Backoffice::AdminsController
  before_action :set_university, only: [:edit, :update, :destroy]

  def index
    @universities = University.all.where(["admin_id = ?", current_admin.id]).page(params[:page]).per(7)
  end

  def new
    @university = University.new
  end

  def create
    @university = University.new(params_university)
    @university.admin = current_admin
    if @university.save
      redirect_to backoffice_admins_universities_path, notice: "A universidade (#{@university.name}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @university.update(params_university)
      redirect_to backoffice_admins_universities_path, notice: "A universidade (#{@university.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    university_name = @university.name
    if @university.destroy
      redirect_to backoffice_admins_universities_path, notice: "A universidade (#{@university.name}) foi deletado com sucesso!"
    else
      render :index
    end
  end

  private

    def set_university
      @university = University.find(params[:id])
    end

    def params_university
      params.require(:university).permit(:name, :city)
    end
end
