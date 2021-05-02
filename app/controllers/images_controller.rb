class ImagesController < ApplicationController
  include Response

  before_action :set_images, only: :index

  # GET /images
  def index
    json_response(@images)
  end

  # GET /search/{term}
  def search
    @images = Image.search_in_fields(params[:searchTerm])
    json_response(@images)
  end

  private

  def set_images
    @images = PhotoStorage.new.all
  end

  def image_params
    params.permit(:id, :author, :camera, :tags, :cropped_picture, :full_picture)
  end
end
