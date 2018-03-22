#!/usr/bin/env ruby

target_ramdom_array = [44, 77, 60, 72, 100, 65, 64, 50, 15, 81, 92, 54, 27, 75, 76, 68, 20, 19, 52, 84, 83, 98, 70, 23, 51, 78, 99, 89, 2, 39, 67, 61, 97, 53, 37, 47, 63, 6, 24, 4, 10, 38, 3, 45, 88, 16, 59, 5, 82, 58, 35, 40, 62, 28, 49, 66, 22, 73, 14, 79, 86, 74, 48, 57, 80, 96, 43, 91, 95, 34, 69, 46, 29, 13, 87, 36, 55, 71, 56, 31, 9, 1, 17, 42, 21, 12, 33, 25, 26, 7, 8, 32, 90, 94, 93, 85, 41, 30, 11, 18]

class Sorter
  def initialize(arr)
    @arr = arr
  end

  def sort!
    @arr = self.__sort(@arr)
  end

  def sort
    self.__sort(@arr)
  end

  def print
    p @arr
  end

  protected

  def __sort(arr)
    # dummy implementation
    raise Exception.new('please implement #{__method__} at extended class')
  end
end

class NakanosCheapSorter < Sorter
  protected

  def __sort(arr)
    _arr = arr.clone
    sorted_arr = []

    while _arr.size > 0
      min_value, i = _arr.each_with_index.min # 一番ちっちゃい値を取り出しちゃう
      sorted_arr.push(min_value) # どんどん突っ込んでいく
      _arr.delete_at(i) # 一度突っ込んだ一番小さい要素は消してリトライ。 どんどん減っていく。
    end

    sorted_arr
  end
end

class SelectionSorter < Sorter
  protected

  def __sort(arr)
    _arr = arr.clone

    (0..._arr.size).each do |i|
      # 今の値を一時的な最小値としておく
      min_value_index = i
      min_value = _arr[i]

      # 一時的な最小値以降の要素をチェック、随時最小値を更新
      ((i + 1)..._arr.size).each do |ii|
        if min_value > _arr[ii]
          min_value_index = ii
          min_value = _arr[ii]
        end
      end

      # 今の場所の値を、最小の物と入れ替え(swap)する
      _arr[i], _arr[min_value_index] = min_value, _arr[i]
    end

    _arr
  end
end

class BubbleSorter < Sorter
  protected

  def __sort(arr)
    _arr = arr.clone

    (0..._arr.size).each do |i|
      # 一つずつ前後で比較して、どんどん入れ替える → それを繰り返す
      (0...(_arr.size)).each do |ii|
        if _arr[i] < _arr[ii]
          _arr[i], _arr[ii] = _arr[ii], _arr[i]
        end
      end
    end

    _arr
  end
end

# main
p NakanosCheapSorter.new(target_ramdom_array).sort
puts
p SelectionSorter.new(target_ramdom_array).sort
puts
p BubbleSorter.new(target_ramdom_array).sort
