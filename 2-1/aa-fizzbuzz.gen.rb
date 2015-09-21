asciiart = <<END
######                    #####
##      ##  #####  #####  ##  ##  ## ##  #####  #####
######        ##     ##   #####   ## ##    ##     ##
##      ##   ##     ##    ##  ##  ## ##   ##     ##  
##      ##  #####  #####  #####    ####  #####  #####
END

code = <<END
eval((%w(
    1.upto(100) do |n|
      s = n;
      if (n % 15 == 0);
        s = "FizzBuzz"
      elsif (n % 5 == 0);
        s = "Buzz"
      elsif (n % 3 == 0);
        s = "Fizz"
      end;
      puts(s)
    end
##)*""))
END

code = code.split.join

code = asciiart.gsub("#") { code.slice!(0, 1) }

puts code
