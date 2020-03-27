$(document).on('turbolinks:load',function(){
  // PAY.JPの公開鍵をセットします。
  Payjp.setPublicKey('pk_test_a033fe0008575a0892e68fd8');

  //formのsubmitを止めるために, クレジットカード登録のformを定義します。
  var form = $("#charge-form");

  $("#charge-form").click(function() {
    // submitが完了する前に、formを止めます。
    form.find("input[type=submit]").prop("disabled", true);
    // submitを止められたので、PAY.JPの登録に必要な処理をします。

    // formで入力された、カード情報を取得します。
    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
    };

    // PAYJPに登録するためのトークン作成
    Payjp.createToken(card, function(status, response) {
      if (response.error){
        // エラーがある場合処理しない。
        form.find('.payment-errors').text(response.error.message);
        form.find('.submit').prop('disabled', false);
      }   
      else {
        // エラーなく問題なく進めた場合
        // formで取得したカード情報を削除して、Appにカード情報を残さない。
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        var token = response.id;
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      };
    });
  });
});
