require 'date'

class LinksController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def index
    links = Link.all.select('id', 'original_url', 'code')
    render json: { links: links }
  end
end
