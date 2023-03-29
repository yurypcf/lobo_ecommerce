module Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[show edit update destroy]
    before_action :validate_document_number, only: %i[update create]

    def index
      @users = User.all
    end

    def edit; end

    def new
      @user = User.new
    end

    def show; end

    def create
      @user = User.new(new_user_params)

      if @user.save
        redirect_to admin_users_path, notice: 'Usuário criado com sucesso.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'Usuário atualizado com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy

      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: 'Usuário excluído com sucesso.' }
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :document_number, :active, :role)
    end

    def new_user_params
      params.require(:user).permit(:name, :document_number, :email, :password, :password_confirmation, :role)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def validate_document_number
      if @user.nil?
        @user = User.new(new_user_params)
      end

      cpf = CPF.new(@user.document_number)

      unless cpf.valid?
        redirect_to admin_users_path, notice: 'Número de CPF inválido.'
      end
    end
  end
end
