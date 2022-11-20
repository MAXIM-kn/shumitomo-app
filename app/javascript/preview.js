document.addEventListener('DOMContentLoaded', function(){
  const userForm = document.getElementById('user_form');
  const previewList = document.getElementById('previews');
  const previewNil = document.getElementById('previews-nil');
  if (!userForm) return null;
  const fileField = document.querySelector('input[type="file"][name="user[image]"]');
  fileField.addEventListener('change', function(e){
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});