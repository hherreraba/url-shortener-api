require 'date'

class LinksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :show

  respond_to :json

  def index
    links = Link.all.select('id', 'original_url', 'code').where(user_id: current_user.id)
    render json: { links: links }
  end

  def show
    short_url = Link.select('id', 'original_url', 'visitor_counter').find_by(code: params[:code])
    short_url.increment!(:visitor_counter)
    visit = Visit.new(ip_address: request.remote_ip, user_agent: request.user_agent,
                               date_of_visit: Date.today, link_id: short_url.id)

    if visit.save
      render json: {
        message: 'Statistics saved successfully',
        original_url: short_url
      }
    else
      render json: { message: 'Something went wrong' }
    end
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
