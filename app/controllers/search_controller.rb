class SearchController < ApplicationController
  def index
  end

  def search
    if params[:term].blank?
      redirect_to root_path
    else
      term = params[:term].strip

      if not self.is_question?(term)
        respond_to do |format|
          format.html { redirect_to root_path, notice: "No results found for #{term}. Make it a full question. Eg What is made of foam" }
        end
        return
      end
      
      @articles = Article.search_article(term.downcase)
      if @articles.empty?
        respond_to do |format|
          format.html { redirect_to root_path, notice: "No results found for #{term}" }
        end
        return 
      end
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

  private

  def search_params
    params.require(:search).permit(:term)
  end

  def is_question?(term)
    question_elements = ["who", "what", "when", "where", "why", "how", "?"]
    question_starters = ["is", "are", "do", "does", "did", "can", "could", "will", "would", "shall", "should", "may", "might", "must", "have", "has", "had", "am", "which", "won't", "can't", "isn't", "aren't", "is", "do", "does", "will", "can"]
    if term.nil?
      return false
    end

    terms_array = term.downcase.strip.split
    terms_array.each do |element|
      if question_elements.include?(element)
        terms_array.delete(element)
      end
    end

    puts terms_array
    puts "#"*80
    if terms_array.length >= 2
      if question_starters.include?(terms_array[0])
        return true
      end
    end

    return false

    
  end

end