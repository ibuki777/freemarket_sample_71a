$(function(){
  var category = $("#product_category_id");

  function addSelect(){
    var html = `<select name="product[category_id]" id="product_category_id"><option value="">選択がありません</option>
                  <option value="1">レディース</option>
                  <option value="2">メンズ</option>
                  <option value="3">ベビー・キッズ</option>
                  <option value="4">インテリア・住まい・小物</option>
                  <option value="5">本・音楽・ゲーム</option>
                  <option value="6">おもちゃ・ホビー・グッズ</option>
                  <option value="7">コスメ・香水・美容</option>
                  <option value="8">家電・スマホ・カメラ</option>
                  <option value="9">スポーツ・レジャー</option>
                  <option value="10">ハンドメイド</option>
                  <option value="11">チケット</option>
                  <option value="12">自転車・オートバイ</option>
                  <option value="13">その他</option></select>`
    return html
  };






  category.change(function(){
  console.log("change");

  var html = addSelect

  
  $(".try").append(html);
  console.log("append");
  
  });

  
  
  


});