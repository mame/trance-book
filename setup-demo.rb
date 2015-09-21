#!/usr/bin/env ruby

require "fileutils"
require "json"

FileUtils.mkdir_p("gen/demo/fs")

jor1k_master_min = File.read("vendor/jor1k/bin/jor1k-master-min.js")
jor1k_master_min.gsub!("../bin/jor1k-worker-min.js", "jor1k-worker-min.js")
File.write("gen/demo/jor1k-master-min.js", jor1k_master_min)

FileUtils.cp("vendor/jor1k/bin/jor1k-worker-min.js", "gen/demo")
FileUtils.cp("vendor/jor1k/bin/or1k/vmlinux.bin.bz2", "gen/demo")
Dir.glob("{jor1k-fs/base-fs/*/,vendor/jor1k/utils/fs/*/}").each do |dir|
  FileUtils.cp_r(dir, "gen/demo/fs")
end
FileUtils.cp("vendor/jor1k/utils/fs.json", "gen/demo/extended-fs.json")

fs = {}

DATA.each do |line|
  type, mode, path, link = line.chomp.split(":")
  entry = fs
  path.split("/").each do |name|
    entry = entry[name] ||= {}
  end
  entry[:attr] = { mode: mode }
  if path.include?("guest")
    entry[:attr][:uid] = 1000
    entry[:attr][:gid] = 1000
  end
  case type
  when ?C
    entry[:attr][:size] = 1377512
    entry[:attr][:c] = 1
    entry[:attr][:load] = 1
  when ?S
    entry[:attr][:path] = link
  when ?F
    entry[:attr][:size] = File.size(File.join("gen/demo/fs", path))
    entry[:attr][:load] = 1 end
end

def dump(entries)
  entries.map do |name, sub|
    h = { "name" => name }.merge(sub.delete(:attr))
    h["child"] = dump(sub)
    h
  end
end

File.write("gen/demo/base-fs.json", JSON.generate({ src: "fs", fs: dump(fs) }))

__END__
D:40775:bin:
S:120777:bin/login:busybox
C:104755:bin/busybox:
S:120777:bin/sh:busybox
S:120777:bin/init:busybox
D:40775:etc:
F:100775:etc/group:
F:100644:etc/fstab:
F:100755:etc/inittab:
F:100644:etc/host.conf:
F:100644:etc/passwd:
F:100644:etc/profile:
D:40775:etc/init.d:
F:100775:etc/init.d/rcS:
D:40755:home:
D:42755:home/guest:
D:40755:usr:
D:40755:usr/sbin:
D:40755:usr/bin:
D:40700:root:
D:40755:sbin:
D:40755:dev:
D:40755:proc:
D:40755:sys:
D:41777:tmp:
D:40755:var:
D:40777:var/run:
D:40755:var/empty:
