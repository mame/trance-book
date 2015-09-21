require 'webrick'
jor1k = File.join(__dir__, "..", "..", "gen")
module_files = {}
s = WEBrick::HTTPServer.new(
  Port: 8080,
  DocumentRoot: jor1k,
  RequestCallback: proc do |req, res|
    if req.path =~ %r(^/demo/fs/+(lib/modules.*?)(?:\.bz2)?$)
      module_files[$1] = true
    end
  end
)
(%w(TERM QUIT HUP INT) & Signal.list.keys).each do |sig|
  Signal.trap(sig) do
    s.shutdown
    module_files.keys.each do |path|
      until path == "lib"
        path = File.dirname(path)
        module_files[path] = true
      end
    end
    open(File.join(__dir__, "..", "loaded-linux-headers.txt"), "w") do |f|
      module_files.keys.sort.each do |path|
        f.puts path
      end
    end
  end
end
s.start
