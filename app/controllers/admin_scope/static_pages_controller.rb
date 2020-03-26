module AdminScope
  class StaticPagesController < BaseController
    before_action :set_static_page, only: %i[show edit update destroy]

    def show
    end

    def new
      @static_page = StaticPage.new
    end

    def edit
    end

    def create
      @static_page = StaticPage.new(static_page_params)

      if @static_page.save
        redirect_to [:admin_scope, @static_page], notice: "Static page was successfully created."
      else
        render :new
      end
    end

    def update
      if @static_page.update(static_page_params)
        redirect_to [:admin_scope, @static_page], notice: "Static page was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @static_page.destroy
      redirect_to root_path, notice: "Static page successfully removed"
    end

    private

    def set_static_page
      @static_page = StaticPage.find(params[:id])
    end

    def static_page_params
      params.require(:static_page).permit(:title, :content)
    end
  end
end
