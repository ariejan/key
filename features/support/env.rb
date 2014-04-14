require 'fileutils'
require 'aruba/cucumber'

require 'key'

bin_dir = File.expand_path('../fakebin', __FILE__)

Before do
  # Put fakebin on the PATH
  set_env 'PATH', "#{bin_dir}:#{ENV['PATH']}"

  # Create a tmp home directory
  set_env 'HOME', File.expand_path(File.join(current_dir, 'home'))

  FileUtils.mkdir_p ENV['HOME']

  @aruba_timeout_seconds = 5
  @aruba_io_wait_seconds = 0.02
end

World Module.new {
  def history
    histfile = File.join(ENV['HOME'], '.history')
    if File.exist? histfile
      File.readlines histfile
    else
      []
    end
  end

  def assert_command_run cmd
    cmd += "\n" unless cmd[-1..-1] == "\n"
    history.should include(cmd)
  end
}
