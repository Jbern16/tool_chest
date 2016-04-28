require 'test_helper'

class UserCreatesToolTest < ActionDispatch::IntegrationTest

  test "user can create a tool" do
    visit new_tool_path

    fill_in "Name", with: "ScrewDriver"
    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "10"

    click_button "Create Tool"

    assert_equal tool_path(Tool.last.id), current_path

    within(".tool_info") do
      assert page.has_content?("ScrewDriver")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
    end
  end

  test "tool isnt created when part of form is blank" do
    skip
    visit new_tool_path

    fill_in "Price", with: "10.99"
    fill_in "Quantity", with: "10"

    click_button "Create Tool"

    assert_equal new_tool_path, current_path
  end
end
