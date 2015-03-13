class Post < ActiveRecord::Base

  validates :title, presence: true

  def lead
    if content.length < 100
      content
    else
      "#{content.first(100)}..."
      # "#{content.first(content.index(" ", 100))}..."
    end
  end

  def ==(other)
    self.title == other.title
  end

  def by?(author)
    self.author == author
  end

  def same_category?(post)
    self.cateogry == post.category
  end

end
