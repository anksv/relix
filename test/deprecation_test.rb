require 'test_helper'
require "stringio"

class DeprecationTest < RelixTest
  def test_deprecation_warning
    stderr = capture_stderr do
      Relix.deprecate("This is deprecated in the current version", 2)
    end
    assert_equal "This is deprecated in the current version\n", stderr
  end

  def test_deprecation_error
    assert_raise Relix::DeprecationError do
      Relix.deprecate("This is deprecated in the current version", 1)
    end
  end

  def test_deprecated_indexes
    stderr = capture_stderr do
      Relix::IndexSet.new(Object, nil).indexes
    end
    assert_equal "Calling #indexes is deprecated; use #[] instead.\n", stderr
  end

  def capture_stderr
    old_stderr = $stderr
    $stderr = StringIO.new
    yield
    $stderr.string
  ensure
    $stderr = old_stderr if old_stderr
  end

  def test_deprecated_indexes
    stderr = capture_stderr do
      Relix::IndexSet.new(Object, nil).indexes
    end
    assert_equal "Calling #indexes is deprecated; use #[] instead.\n", stderr
  end

  def capture_stderr
    old_stderr = $stderr
    $stderr = StringIO.new
    yield
    $stderr.string
  ensure
    $stderr = old_stderr if old_stderr
  end
end
