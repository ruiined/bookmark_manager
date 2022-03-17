# frozen_string_literal: true

require 'bookmarks'

describe Bookmarks do
  subject(:bookmarks) { described_class }
  subject(:bookmarks_all) { described_class.all }
  let(:bookmark) { Bookmark }
  let(:title) { 'Google' }
  let(:url) { 'http://google.com' }
  let(:id) { 13 }
  # let(:bookmark_class) { double :bookmark_class, new: bookmark }
  # let(:bookmark) { double :bookmark, id: id, title: title, url: url }

  describe '.all' do
    it 'returns all bookmarks' do
      expect(bookmarks_all).to be_an_instance_of(Array)
    end
  end

  describe '.create' do
    it 'creates a bookmark' do
      bookmarks.create(url, title)
      expect(bookmarks_all).to include bookmark
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = bookmarks.create(url, title)
      bookmarks.delete(bookmark.id)
      expect(bookmarks.all).to be_empty
    end
  end
end
