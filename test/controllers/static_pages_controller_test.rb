require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "数据集"
  end
  
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select 'title',"主页|#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select 'title',"帮助|#{@base_title}"
  end
test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select 'title',"关于|#{@base_title}"
  end
end
