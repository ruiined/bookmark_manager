# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new(id, url, title) }
  let(:id) { 1 }
  let(:title) { 'Google' }
  let(:url) { 'http://google.com' }

  it 'initializes the title' do
    expect(bookmark.title).to eq title
  end

  it 'initializes the url' do
    expect(bookmark.url).to eq url
  end

  it 'initializes the id' do
    expect(bookmark.id).to eq id
  end
end
