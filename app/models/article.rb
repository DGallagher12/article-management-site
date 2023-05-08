class Article < ApplicationRecord

  attribute :published, :boolean, default: false
end

  def get_article_status
    if(self.published)
      return "Completed"
    else
     return "Not ready"
    wns
  end
end
