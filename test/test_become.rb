require 'test/unit'
require 'become'

class BecomeTest < Test::Unit::TestCase
  class Foo
    def initialize
      @a = 1
      @b = 2
    end
  end

  class BarBase
  end

  class Bar < BarBase
    def initialize
      @c = 3
      @d = 4
    end
  end

  def test_become
    foo = Foo.new
    bar = Bar.new

    foo.become(bar)

    assert_equal Bar, foo.class
    assert_equal 3, foo.instance_eval { @c }
    assert_equal 4, foo.instance_eval { @d }

    assert_equal Foo, bar.class
    assert_equal 1, bar.instance_eval { @a }
    assert_equal 2, bar.instance_eval { @b }
  end
end

