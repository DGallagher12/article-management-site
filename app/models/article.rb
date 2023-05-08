class Article < ApplicationRecord

  def get_article_status
    if(self.published)
      return "Completed"
    else
     return "Not ready"
    wns
  end
end
