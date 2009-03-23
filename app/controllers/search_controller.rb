class SearchController < ApplicationController
  def show
    @search_results = ThinkingSphinx::Search.search(params[:query])
    respond_to do |format|
      format.html # results.html.erb
      format.xml  { render :xml => @search_results }
    end
  end
end
