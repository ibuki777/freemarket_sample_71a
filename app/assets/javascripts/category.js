$(function(){
  var category = $("#product_category_id");
  let choice = $("option");
  
  choiceAry = Array.prototype.slice.call(choice)


  function addSelect1(){
    var html1 = `<select name="product[condition_id]" id="product_condition_id"><option value="">選択がありません</option>
                  <option value="1">新品、未使用</option>
                  <option value="2">未使用に近い</option>
                  <option value="3">目立った傷や汚れなし</option>
                  <option value="4">やや傷や汚れあり</option>
                  <option value="5">傷や汚れあり</option>
                  <option value="6">全体的に状態が悪い</option></select>`
    return html1
  };

  function addSelect2(){
    var html2 = `<select name="product[burden_id]" id="product_burden_id"><option value="">選択がありません</option>
                  <option value="1">送料込み（出品者負担）</option>
                  <option value="2">着払い（購入者負担）</option></select>`
    return html2
  }

  

  // カテゴリ１の選択を変える
  category.change(function(){
    var html1 = addSelect1

    if ( category = "選択がありません" ) {
      $("#product_condition_id").remove();
      $("#product_burden_id").remove();
      console.log("減った")

    } else {
      
      // // html1を消す
      $("#product_condition_id").remove();
      $("#product_burden_id").remove();
      
      // // html1を増やす
      $(".try").append(html1);
      console.log("増えた")
    }


      // カテゴリ２の選択肢を変える
        $("#product_condition_id").change(function(){
          var html2 = addSelect2

          $("#product_burden_id").remove();
          // html2を増やす
          $(".try").append(html2);
        });
  });


});
