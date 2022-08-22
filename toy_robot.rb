require './lib/robot'

class ToyRobot

  DIRECTIONS = ['NORTH', 'SOUTH', 'EAST', 'WEST']
  VALID_POSITIONS = ['0', '1', '2', '3', '4']

  def play
    operation = nil
    while operation != 'EXIT'
      args, arguments, operation = nil
      command = gets.chomp.upcase
      operation, arguments = command.split
      args = arguments.split(/\s*,\s*/) if arguments
      if operation != 'EXIT'
        validate_command(operation, args)
        execute_command(operation, args)
      end
    end
  end

  private

  def robot
    @robot ||= Robot.new
  end

  def validate_command(operation, args)
    raise ArgumentError, 'Command invalid' unless Robot.public_method_defined?(operation.downcase)
    case operation
    when 'PLACE'
      if args.nil? || args.size != 3
        raise ArgumentError, 'É preciso enviar as posições X e Y além da direção do robot'
      end

      if !DIRECTIONS.include?(args[2]) || !VALID_POSITIONS.include?(args[0]) || !VALID_POSITIONS.include?(args[1])
        raise ArgumentError, 'A direção do robot ou a posição dele esta invalida'
      end
    end
  end

  def execute_command(operation, args)
    robot.send(operation.downcase, *args)
  end
end

ToyRobot.new.play
