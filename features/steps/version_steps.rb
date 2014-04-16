Then(/^the output should contain current version information$/) do
  version_string = "Key v#{Key::VERSION}"
  assert_partial_output(version_string, all_output)
end

Then(/^`(.*?)` should be run$/) do |cmd|
  assert_command_run cmd
end
