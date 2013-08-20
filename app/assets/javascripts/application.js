//= require jquery
//= require jquery_ujs
//= require_tree .

window.newModal = function(path, title){
  ShopifyApp.Modal.open({
    'src': path,
    'title': title,
    'primaryButton': { 
      label: "OK", 
      message: 'modal_ok', 
      action: function(message){ 
        ShopifyApp.Modal.close("ok"); 
      }
    },
    'buttons': [ { 
      label: "Cancel", 
      action: function(message){ 
        ShopifyApp.Modal.close("cancel"); 
      } 
    } ],
  }, function(result){
    if (result == "ok")
      ShopifyApp.flashNotice("'Ok' button pressed")
    else if (result == "cancel")
      ShopifyApp.flashNotice("'Cancel' button pressed")
  });
}

window.confirmModal = function () {

  ShopifyApp.Modal.confirm({
    title: "Delete your account?",
    message: "Do you want to delete your account? This can't be undone.",
    okButton: "Yes, delete my account",
    cancelButton: "No, keep my account"
  }, function(result){
    if (result)
      ShopifyApp.flashNotice("I'll delete it! (I'm kidding)")
    else
      ShopifyApp.flashNotice("Sure, I'll keep you account. =D")
  });

}

window.inputModal = function (prompt) {
  ShopifyApp.Modal.input(prompt, function(result, data){
    if(result){
      ShopifyApp.flashNotice("You entered: \"" + data + "\". Why?");
    }
    else{
      ShopifyApp.flashNotice("You canceled my question. =(");
    }
  });
}
