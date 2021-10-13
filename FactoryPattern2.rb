require 'pry-byebug'

class IOFactory
  def initialize(format)
    binding.pry
    @reader_class = self.class.const_get("#{format}Reader")
    @writer_class = self.class.const_get("#{format}Writer")
  end
  def new_reader
    @reader_class.new
  end
  def new_writer
    @writer_class.new
  end
end