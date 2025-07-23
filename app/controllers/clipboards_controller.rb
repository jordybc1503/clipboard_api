class ClipboardsController < ApplicationController
  # POST /clipboards   { "content": "texto" }
  def create
    clip = Clipboard.create!(content: params[:content])
    render json: { id: clip.id, content: clip.content }, status: :created
  end

  # GET /clipboards/latest
  def latest
    clip = Clipboard.order(created_at: :desc).first
    if clip
      render json: clip
    else
      head :no_content
    end
  end
end
