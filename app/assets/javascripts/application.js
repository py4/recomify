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
  }, function(result, data){
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
    Shopify.API.flashNotice('Closing the confirm modal.')
  });

}

// Make a delete form and submit it, non AJAX.
window.deleteFormSubmit = function(location) {
  var form = document.createElement('form');
  form.setAttribute('method', 'POST');
  form.setAttribute('action', location);
  var h = document.createElement('input');
  h.setAttribute('type', 'hidden');
  h.setAttribute('name', '_method');
  h.setAttribute('value', 'delete');
  form.appendChild(h);
  document.body.appendChild(form);
  form.submit();
}

window.shopifyDeleteConfirm = function(location, message) {
  if(!message) {
    message = 'Are you sure you want to delete this?';
  }
  Shopify.API.Modal.confirm(message, function(result, data){
    if(result){
      deleteFormSubmit(location);
    }
  });
}