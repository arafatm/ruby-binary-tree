class Merge
  def sort(a)
    return a if a.length <= 1
    puts "size #{a.size}"
    puts "half = #{(a.size / 2.0).round}"
    puts "sorting #{a.inspect}"

    l = Array.new
    r = Array.new

    l,r = a.each_slice((a.size/2.0).round).to_a

    # recurse sort l,r
    return merge(sort(l), sort(r))

  end

  def merge(l,r)
    puts "merging #{l.inspect}  #{r.inspect}"

    sorted = []

    until l.empty? || r.empty?
      if l.first <= r.first
        sorted << l.shift
      else
        sorted << r.shift
      end
    end


    return sorted.concat(l).concat(r)
  end


end
