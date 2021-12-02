require 'date'

class LinksController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def index
    links = Link.all.select('id', 'original_url', 'code')
    render json: { links: links }
  end

  def create
    last_id = Link.maximum(:id) || 1
    code = encode(last_id.to_s)
    link = Link.new(original_url: params[:link][:original_url],
                    code: code, user_id: current_user.id)

    if link.save
      render json: { message: 'Short url sucessfully created' }
    else
      render json: { error: 'Something went wrong' }
    end
  end

  def update
    link = Link.find_by(code: params[:id])

    if link.update(original_url: params[:link][:original_url])
      render json: { message: 'Url successfully updated' }
    else
      render json: { message: 'Something went wrong' }
    end
  end

  def destroy
    link = Link.find_by(code: params[:id])

    if link.destroy
      render json: { message: 'Url successfully deleted' }
    else
      render json: { message: 'Something went wrong' }
    end
  end

  private

  def encode(last_id)
    (Array.new(5) { [*'a'..'z', *'A'..'Z', *1..9].sample }.join + last_id).chars.shuffle.join
  end
end
