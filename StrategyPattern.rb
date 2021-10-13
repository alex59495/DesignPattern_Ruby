class Report
  attr_accessor :formatter
  attr_reader :title, :text
  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well.']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(@title, @text)
  end
end

class HTMLReport
  def output_report(title, text)
    puts('<html>')
    puts(' <head>')
    puts("<title>#{title}</title>")
    puts(' </head>')
    puts(' <body>')
    text.each do |line|
      puts("
      <p>#{line}</p>" )
    end
    puts(' </body>')
    puts('</html>')
  end
end

class PlainTextReport
  def output_report(title, text)
    puts("***** #{title} *****")
      text.each do |line|
      puts(line)
    end
   end
end

report = Report.new(HTMLReport.new)
p report.output_report
report = Report.new(PlainTextReport.new)
p report.output_report