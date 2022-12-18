class CalcController < ApplicationController
  def input
  end

  def output
    if params[:val] == ''
      flash[:warning] = 'Fill in the field'
    elsif params[:val].scan(/\d+/).map(&:to_i).length < 10
      flash[:warning] = 'The number of entered numbers must be greater than 9!'
    end
    if flash.empty?
      val = params[:val].scan(/\d+/).map(&:to_i)
      res = CalcController.processor(val)
      @result1 = res[0]
      @result2 = res[1]
      @result3 = res[2]
    else
      redirect_to '/calc/input'
    end
  end

  def self.processor(mas)
    arr = []
    boofer = []
    cur = mas[0]
    mas.each do |i|
      if i >= cur
        boofer.push(i)
        cur = i
      else
        arr.push(boofer)
        boofer = []
        boofer.push(i)
        cur = i
      end
    end
    arr.push(boofer)
    s1 = mas.join(' ')
    s2 = composit(arr)
    s3 = maxlenseq(arr)
    [s1,s2,s3]
  end
  def self.composit(a)
    s = ""
    a.each do |i|
      s += i.join(' ')
      s += ', ' if i != a[-1]
    end
    s
  end
  def self.maxlenseq(a)
    n = []
    a.each{|i| n = i if i.length > n.length}
    n.join(' ')
  end
end
