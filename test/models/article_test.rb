require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should save article" do
    article=Article.new
    assert article.save
  end

  test "find article" do
    article = Article.new()
     article.title = "How to cook fish"
     article.body = "Put it in the oven"
     article.published = false
     article.save

     expected_article = Article.find(article.id)
     assert_equal(expected_article.title, article.title)
     assert_equal(expected_article.body, article.body)
     assert_equal(expected_article.published, article.published)
  end

  test "delete article" do
     article=Article.new
     article.save
     assert_difference("Article.count", -1) do
       article.destroy
     end

  end

  test "update article" do
     one = articles(:one)
     one.update({
      title: "How to paint a fence"
     })
     assert_equal("How to paint a fence", one.title)
  end

  test "should be marked as avalable when published" do
    one = articles(:one)
    assert_equal(one.get_article_status(), "Completed")
  end

  test "should be not ready when not published" do
    two = articles(:two)
    assert_equal(two.get_article_status(), "Not ready")
  end
end
