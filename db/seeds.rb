@category1 = Category.create(name:"カテゴリ 1")

category1s = [
              {level2:"カテゴリ 1-1",level2_children:["1-1-1","1-1-2","1-1-3"]},
              {level2:"カテゴリ 1-2",level2_children:["1-2-1","1-2-2","1-2-3"]}
             ]

category1s.each.with_index(1) do |category1,i|
  level2_var="@category1_#{i}"
  level2_val= @category1.children.create(name:"#{category1[:level2]}")
  eval("#{level2_var} = level2_val")
  category1[:level2_children].each do |level2_children_val|
    eval("#{level2_var}.children.create(name:level2_children_val)")
  end
end