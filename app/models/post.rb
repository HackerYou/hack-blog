class Post < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes

  def self.entitled(title)
    where(title: title)
  end

  def self.search(term)
    matcher = "%#{term.downcase}%"

    where("lower(title) like ? OR lower(content) like ?", matcher, matcher)
  end

  def self.this_week
    where('created_at > ?', 1.week.ago)
  end

  def lead
    if content.length < 300
      content
    else
      "#{content.first(300)}..."
      # "#{content.first(content.index(" ", 300))}..."
    end
  end

  def ==(other)
    self.title == other.title
  end

  def by?(author)
    self.author == author
  end

  def same_category?(post)
    self.category == post.category
  end
end
