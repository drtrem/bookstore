$('#use_billing').change(function(){
  document.getElementById('form2').style.display = this.checked ? 'none' : 'block';
});

  function showOrHide() {
		document.getElementById('form2').style.display = this.checked ? 'none' : 'block';
  }