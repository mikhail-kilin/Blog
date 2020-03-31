module AdminScope
  class StaticPagesController < BaseController
    expose :static_page, find_by: :slug

    def show
    end

    def new
    end

    def edit
    end

    def create
      static_page.save

      respond_with static_page, location: admin_scope_static_page_path(static_page)
    end

    def update
      static_page.update(static_page_params)

      respond_with static_page, location: admin_scope_static_page_path(static_page)
    end

    def destroy
      static_page.destroy
      redirect_to root_path, notice: "Static page successfully removed"
    end

    private

    def static_page_params
      params.require(:static_page).permit(:title, :content, :slug)
    end
  end
end
