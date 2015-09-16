print "\x1b[2J" # 画面クリア

loop do
  # 1 フレーム目描画
  print "\x1b[1;1H" #カーソルを左上へ移動
  puts "   ()    "
  puts "  -[]-   "
  puts "   /\\    "
  sleep 0.2 # ウェイト

  # 2 フレーム目描画
  print "\x1b[1;1H" #カーソルを左上へ移動
  puts "     ()   "
  puts "    -[]-  "
  puts "    // "
  sleep 0.2 # ウェイト

  # 3 フレーム目描画
  print "\x1b[1;1H" #カーソルを左上へ移動
  puts "   ()    "
  puts "  -[]-   "
  puts "   /\\    "
  sleep 0.2 # ウェイト

  # 4 フレーム目描画
  print "\x1b[1;1H" #カーソルを左上へ移動
  puts " ()     "
  puts "-[]-    "
  puts "  \\\\    "
  sleep 0.2 # ウェイト
end
