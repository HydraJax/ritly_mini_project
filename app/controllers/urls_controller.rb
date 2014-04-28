class UrlsController < ApplicationController

	def index
		@urls = Url.all
	end

	def new
		@url = Url.new
	end

	def create
		# takes params from method bleow
		@url = Url.create url_params
		# params.require(:url).permit(:link, :random_string)
		# redirect just took us to another page w/url;id
		redirect_to url_path @url.id
	end

	def show
		@url = Url.find params[:id]
	end

	def edit
		@url = Url.find(params[:id])
	end

	def update
	   	@url = Url.find(params[:id])
    	@url.update url_params
    	redirect_to url_path(@url)
	end

	def go
		@url = Url.find_by_random_string(params[:random_string])
		redirect_to @url.link
	end

	def destroy
    	Url.find(params[:id]).destroy
    	redirect_to root_path
	end

	private
		def url_params
			params.require(:url).permit(:link, :random_string)
		# this returns the link and rando from the form
		end

end
