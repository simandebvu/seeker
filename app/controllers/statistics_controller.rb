class StatisticsController < ApplicationController
  def index
    @searches = Search.order(count: :desc)
    respond_to do |format|
      format.json { render json: @searches, :only => [:id, :term, :count, :article_count, :zero_article_count] }
      format.html
    end
  end
  def clear_statistics
    Search.destroy_all
    respond_to do |format|
      format.html { redirect_to root_path, notice: "All statistics were deleted." }
    end
  end
end
