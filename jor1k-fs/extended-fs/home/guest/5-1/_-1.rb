$src = ""
def method_missing(method_name)
  $src << method_name.size
end
at_exit { eval($src) }
