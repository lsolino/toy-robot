class Robot

  def initialize(position_x = nil, position_y = nil, direction = nil)
    @board_size = 5
    @position_x = position_x
    @position_y = position_y
    @direction = direction
  end

  def place(x_position, y_position, direction)
    @position_x = x_position.to_i
    @position_y = y_position.to_i
    @direction = direction
  end

  def move
    raise ArgumentError, 'Robot nao esta no tabuleiro' unless placed?

    case @direction
    when 'NORTH'
      go_to_north
    when 'SOUTH'
      go_to_south
    when 'EAST'
      go_to_east
    when 'WEST'
      go_to_west
    else
      raise ArgumentError, 'Incorrect direction'
    end
  end

  def right
    raise ArgumentError, 'Robot nao esta no tabuleiro' unless placed?

    case @direction
    when 'NORTH'
      @direction = 'EAST'
    when 'SOUTH'
      @direction = 'WEST'
    when 'EAST'
      @direction = 'SOUTH'
    when 'WEST'
      @direction = 'NORTH'
    else
      raise ArgumentError, 'Impossible to go to the right'
    end
  end

  def left
    raise ArgumentError, 'Robot nao esta no tabuleiro' unless placed?

    case @direction
    when 'NORTH'
      @direction = 'WEST'
    when 'SOUTH'
      @direction = 'EAST'
    when 'EAST'
      @direction = 'NORTH'
    when 'WEST'
      @direction = 'SOUTH'
    else
      raise ArgumentError, 'Impossivel rotacionar para a direita'
    end
  end

  def report
    raise ArgumentError, 'Robot nao esta no tabuleiro' unless placed?

    p "#{@position_x}, #{@position_y}, #{@direction}"
  end

  def placed?
    if (0..@board_size).include?(@position_x) && (0..@board_size).include?(@position_y)
      true
    else
      false
    end
  end

  private

  def go_to_north
    new_y_position = @position_y - 1
    @position_y = new_y_position if new_y_position >= 0
  end

  def go_to_south
    new_y_position = @position_y + 1
    max_y_position = 4
    @position_y = new_y_position if new_y_position <= max_y_position
  end

  def go_to_east
    new_x_position = @position_x + 1
    max_x_position = 4
    @position_x = new_x_position if new_x_position <= max_x_position
  end

  def go_to_west
    new_x_position = @position_x - 1
    @position_x = new_x_position if new_x_position >= 0
  end

end
