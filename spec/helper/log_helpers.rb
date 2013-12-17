module RSpecHelper

  def pputs *args
    puts '--------------'
    args.each do |arg|
      p arg
    end
    puts '--------------'
  end

end
