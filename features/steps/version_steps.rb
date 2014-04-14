Then(/^the output should contain current version information$/) do
  version_string = "Key v#{Key::VERSION}"
  assert_partial_output(version_string, all_output)
end
