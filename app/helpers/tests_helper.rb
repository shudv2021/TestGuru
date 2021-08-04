module TestsHelper
  TEST_LEVEL = {0=>'easy', 1=>'elementary', 2=>'advanced', 3=>'hard'}.freeze
  def test_level(test)
    TEST_LEVEL[test.level] || :hero
  end
end
