# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new(url, title) }
  let(:title) { 'Google' }
  let(:url) { 'http://google.com' }

  it 'initializes the title' do
    expect(bookmark.title).to eq title
  end

  it 'initializes the url' do
    expect(bookmark.url).to eq url
  end
end
