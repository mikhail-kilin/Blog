module AdminScope
  class StaticPagesController < BaseController
    expose :static_page, find_by: :slug
    expose :static_pages, -> { fetch_static_pages }

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      static_page.save

      respond_with :admin_scope, static_page
    end

    def update
      static_page.update(static_page_params)

      respond_with static_page, location: admin_scope_static_page_path(static_page)
    end

    def destroy
      static_page.destroy
      redirect_to admin_scope_static_pages_path, notice: "Static page successfully removed"
    end

    private

    def static_page_params
      params.require(:static_page).permit(:title, :content, :slug)
    end

    def fetch_static_pages
      StaticPage.page(params[:page])
    end
  end
end
