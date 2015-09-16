# 元データの基数
INPUT_BIN = 256

# LZ78 圧縮: (0...INPUT_BIN) の数字の配列を圧縮する
def lz78_compress(uncompressed_data)
  # トライ木
  root = ptr = (0 ... INPUT_BIN).map {|n| [n, []] }

  # 圧縮
  codes = []
  cur_code = nil
  max_code = INPUT_BIN
  uncompressed_data.each do |d|
    if ptr[d]
      # 中間ノードを降りる
      cur_code, ptr = ptr[d]
    else
      # 葉ノードに到着したので符号を出力する
      codes << [cur_code, max_code]

      # トライ木に新たな符号を登録する
      ptr[d] = [max_code, []]
      max_code += 1

      # トライ木の根に戻る
      cur_code, ptr = root[d]
    end
  end
  # データ終端の符号を出力
  codes << [cur_code, max_code + 1]

  # 符号の列を数字に変換する [注]
  first_code, = codes.shift
  n = 0
  codes.reverse_each do |code, max_code|
    n = n * max_code + code
  end

  # 圧縮データは [最初の符号, 数字, 符号長] の 3 つ組
  compressed_data = [first_code, n, codes.size]

  return compressed_data
end

# LZ78 解凍
def lz78_decompress(first_code, n, len)
  # 符号表
  table = (0...INPUT_BIN).map {|code| [code] }

  # 解凍
  uncompressed_data = cur_buff = prev_buff = [first_code]
  (INPUT_BIN + 1).upto(len + INPUT_BIN) do |max_code|
    # 現在の符号を取り出す
    code = n % max_code
    n /= max_code

    # 符号表を引く
    cur_buff = table[code] || cur_buff

    # 符号表を拡張する
    table << prev_buff + [cur_buff[0]]

    # 解凍データに追記する
    uncompressed_data += prev_buff = table[code]
  end

  uncompressed_data
end

# 文字列を圧縮する
compressed_data = lz78_compress("Hello, hello, hello!".bytes)

# 圧縮データ
p compressed_data #=> [72, 961193305173596169800385738175379, 14]

# 解凍して元の文字列を得る
p lz78_decompress(*compressed_data).pack("C*") #=> "Hello, hello, hello!"
