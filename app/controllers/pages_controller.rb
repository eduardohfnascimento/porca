class PagesController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      Post,
      params[:filterrific],
      select_options: {
        with_course_id: Course.options_for_select,
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [:with_course_id],
    ) or return
    @posts = @filterrific.find.page(params[:page])
 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def contribute
  end

  def about
  end

  def faq
  end
end
