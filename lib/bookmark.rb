# frozen_string_literal: true

require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end
end
