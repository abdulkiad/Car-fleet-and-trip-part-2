class Test

def boss(image)

yo=Hash.new 0

image.each do |word|
  yo[word]+=1


end


  puts yo.va(yo.values.max)
end

image=['red','blue','red',
'red','yellow','red',
'red','green','red']

boss(image)


end