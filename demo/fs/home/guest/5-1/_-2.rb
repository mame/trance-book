N = 8

$line = []
$lines = [$line]
def method_missing(method_name, *args)
  if args.empty?
    $line = [method_name.size - 1]
    $lines << $line
  else
    $line.unshift(method_name.size - 1)
  end
end
at_exit do
  undef method_missing
  src = ""
  $lines.flatten.each_slice(3) {|digits| src << digits.join.to_i(N) }
  eval src
end
