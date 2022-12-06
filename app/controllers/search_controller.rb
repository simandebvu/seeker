class SearchController < ApplicationController
  def index
  end

  def search
    if params[:term].blank?
      redirect_to root_path
    else
      term = params[:term].strip
      @articles = Article.search_article(term.downcase)
      time = DateTime.now.strftime("%Q")
      ip = request.ip
      redis = Redis.new(url: ENV["REDIS_URL"])
      redis.set(
        "ip:#{ip}:#{time}",
        {
          term: term,
          submit: params[:submit],
          ip: ip,
          search_time: time,
          article_count: @articles.count,
        }.to_json
      )
      SearchWorker.perform_async()
      redis.close

      # # redirect_to results_path if params[:submit] == "true" 
      # respond_to do |format|
      #   # respond to page with @articles and render results page
      #   format.html { render :results }
      #   format.json { render json: @articles, :only => [:id, :title] }
    end
  end

  def results 

  end
end
