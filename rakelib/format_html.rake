require 'syntax/convertors/html'

module FormatHtml

  module_function

  def format(outfile, infile)
    open(outfile, "w") do |out|
      out.puts "<html>"
      out.puts "  <head>"
      out.puts "    <style type=\"text/css\">"
      out.puts %(
.ruby { font-size: 18pt; font-weight: bold; }
.ruby .normal {}
.ruby .comment { color: #888; font-style: italic; }
.ruby .keyword { color: #9C1A4A; font-weight: bold; }
.ruby .method { color: #0461B3; font-weight: bold; }
.ruby .class { color: #074; font-weight: bold; }
.ruby .module { color: #050; font-weight: bold; }
.ruby .punct { color: #447; font-weight: bold; }
.ruby .symbol { color: #0012DE; font-weight: bold; }
.ruby .string { color: #00B536; font-weight: bold; }
.ruby .char { color: #00B536; font-weight: bold; }
.ruby .ident { color: #004; font-weight: bold; }
.ruby .constant { color: #074; font-weight: bold; }
.ruby .regex { color: #B66; font-weight: bold; }
.ruby .number { color: #AD00B3; font-weight: bold; }
.ruby .attribute { color: #377; font-weight: bold; }
.ruby .global { color: #3B7; font-weight: bold; }
.ruby .expr { color: #227; font-weight: bold; })
      out.puts "    </style>"
      out.puts "  </head>"
      out.puts "  <body>"
      out.puts "    <pre class=\"ruby\">"
      code = open(infile) { |f| f.read }
      convertor = Syntax::Convertors::HTML.for_syntax("ruby")
      html = convertor.convert(code)
      out.puts html
      out.puts "    </pre>"
      out.puts "  </body>"
      out.puts "</html>"
    end
  end
end

SRC_FILES = FileList['src/**/*.rb']

directory "html"

FILE_PAIRS = SRC_FILES.inject({}) { |hash, fn|
  hash.merge(fn => fn.gsub(/\//, '-').sub(/^src-/, 'html/').ext(".html"))
}

task :format_html => FILE_PAIRS.values

file "html/index.html" => ["html"] do
  open("html/index.html", "w") do |f|
    f.puts "<html><body><h1>Source Files</h1>"
    f.puts "<ul>"
    FILE_PAIRS.values.each do |html|
      f.puts %{<li><a href="#{html.pathmap('%f')}">#{html.pathmap('%n').gsub(/-/,'/')}</a></li>}
    end
    f.puts "</ul>"
    f.puts "</body></html>"
  end
end

FILE_PAIRS.each do |src_file, html_file|
  file html_file => ["html/index.html", src_file] do
    puts "Formatting #{src_file}"
    FormatHtml.format html_file, src_file
  end
end
