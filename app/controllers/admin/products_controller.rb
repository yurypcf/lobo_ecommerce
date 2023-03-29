module Admin
  class ProductsController < BaseController
    before_action :set_product, only: %i[show edit update destroy]

      def index
        @products = Kaminari.paginate_array(Product.order(:name)).page(params[:page]).per(10)

        @search = params['search']
        if @search.present?
          @name = @search['name']
          @products = Kaminari.paginate_array(Product.where('name ILIKE ?', "%#{@name}%").order(:name)).page(params[:page]).per(10)
        end
      end

      def new
        @product = Product.new
      end

    def show; end

      def create
        @product = Product.new(product_params)

        if @product.save
          redirect_to admin_products_path, notice: 'Produto criado com sucesso.'
        else
          render :new, status: :unprocessable_entity
        end
      end

      def update
        if @product.update(product_params)
          redirect_to admin_products_path, notice: 'Produto atualizado com sucesso.'
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy

       respond_to do |format|
          format.html { redirect_to admin_products_path, notice: 'Produto excluído com sucesso.' }
        end
      end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :image, :quantity, :active)
    end
  end
end