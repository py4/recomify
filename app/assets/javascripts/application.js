//= require jquery
//= require jquery_ujs
//= require_tree .

Shopify.API.debug = true;

window.newModal = function(path, title){
  Shopify.API.Modal.open({
    'src': path,
    'title': title,
    'primaryButton': { 
      label: "OK", 
      message: 'modal_ok', 
      action: function(message){ 
        Shopify.API.Modal.close("ok"); 
      }
    },
    'buttons': [ { 
      label: "Cancel", 
      action: function(message){ 
        Shopify.API.Modal.close("cancel"); 
      } 
    } ],
  }, function(result){
    if (result == "ok")
      Shopify.API.flashNotice("'Ok' button pressed")
    else if (result == "cancel")
      Shopify.API.flashNotice("'Cancel' button pressed")
  });
}

window.confirmModal = function () {

  Shopify.API.Modal.confirm({
    title: "Delete your account?",
    message: "Do you want to delete your account? This can't be undone.",
    okButton: "Yes, delete my account",
    cancelButton: "No, keep my account"
  }, function(result){
    if (result)
      Shopify.API.flashNotice("I'll delete it! (I'm kidding)")
    else
      Shopify.API.flashNotice("Sure, I'll keep you account. =D")
  });

}

window.inputModal = function (prompt) {
  Shopify.API.Modal.input(prompt, function(result, data){
    if(result){
      Shopify.API.flashNotice("You entered: \"" + data + "\". Why?");
    }
    else{
      Shopify.API.flashNotice("You canceled my question. =(");
    }
  });
}
