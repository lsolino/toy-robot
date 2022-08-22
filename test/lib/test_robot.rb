require_relative '../../lib/robot'
require 'minitest'
require 'minitest/autorun'
class RobotTest < Minitest::Test
  def setup
    @robot ||= Robot.new
  end

  def test_place
    @robot.place(1,2,'EAST')
    assert_equal "1, 2, EAST", @robot.report
  end

  def test_left
    @robot.place(0,0,'SOUTH')
    @robot.left
    assert_equal "0, 0, EAST", @robot.report
  end

  def test_right
    @robot.place(0,0,'WEST')
    @robot.right
    assert_equal "0, 0, NORTH", @robot.report
  end

  def test_that_moves
    @robot.place(0,0,'EAST')
    @robot.move
    assert_equal "1, 0, EAST", @robot.report
  end

  def test_sequence
    @robot.place(1,2,'EAST')
    @robot.move
    @robot.move
    @robot.right
    @robot.move
    assert_equal "3, 3, SOUTH", @robot.report
  end
end
