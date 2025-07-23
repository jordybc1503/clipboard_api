class Clipboard < ApplicationRecord
  validates :content, presence: true

  after_create_commit :broadcast_clip

  private

  def broadcast_clip
    # 1º argumento: canal ; 2º argumento: hash con el mensaje
    ActionCable.server.broadcast("clipboard_channel",
                                 { content: content })
  end
end
