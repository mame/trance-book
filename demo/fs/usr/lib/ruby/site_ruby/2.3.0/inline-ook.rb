class Ook
  Stacks = {}
  def ook
    :ook
  end
  def self.ook
    stack << "."
    :ook
  end
  def self.stack
    Stacks[Thread.current] ||= []
  end
  def self.class_ook(s, a)
    if a
      stack << "." + s + stack.pop
    else
      stack << "."
      new.__send__("Ook" + s, a)
    end
  end
  def instance_ook(s, a)
    l = a ? Ook.stack.pop : ""
    Ook.stack.last << s + l
    self
  end
  def self.global_ook(s, a)
    stack << s + (a ? stack.pop : "")
  end
  def self.Ook (a = nil); Ook.class_ook("",  a); end
  def self.Ook!(a = nil); Ook.class_ook("!", a); end
  def self.Ook?(a = nil); Ook.class_ook("?", a); end
  def Ook (a = nil); instance_ook(".", a); end
  def Ook!(a = nil); instance_ook("!", a); end
  def Ook?(a = nil); instance_ook("?", a); end
end
def Ook!(a = nil); Ook.global_ook("!", a); end
def Ook?(a = nil); Ook.global_ook("?", a); end
def ook(a = nil)
  if a
    s = (Ook.stack || []).join
    raise "Ook? Ook? Ook?" unless s.size.even?
    h = {
      ".?" => "a[i+=1]||=0;",
      "?." => "a[i-=1]||=0;",
      ".." => "a[i]+=1;",
      "!!" => "a[i]-=1;",
      ".!" => "a[i]=$stdin.getc;",
      "!." => "putc(a[i]);",
      "!?" => "while(a[i]>0);",
      "?!" => "end;",
    }
    c = "a=[i=0];"
    s.scan(/../) { c << (h[$&] || raise("Ook? Ook?")) }
    eval c
    Ook::Stacks.delete(Thread.current)
  end
  :ook
end
