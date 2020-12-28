export function like(button,id) {
  const token = document.getElementsByName(
  "csrf-token"
)[0].content;
  const request = new XMLHttpRequest();
  const url = "/posts/"+id+"/like";
  request.open('POST', url);
  request.setRequestHeader('Content-Type', 'application/json');
  request.setRequestHeader('Data-Type', 'application/json');
  request.setRequestHeader('X-CSRF-Token', token);
  request.addEventListener("readystatechange", () => {

    if (request.readyState === 4 && request.status === 200) {
      var post= button.closest(".post");
      console.log(post);
      var likes_count = post.querySelector(".likes")
      console.log(likes_count);
      const data = JSON.parse(request.responseText)
      likes_count.innerHTML = data.count;
      if(data.like){
        button.innerHTML = "LIKE"
      }else{
        button.innerHTML = "DESLIKE"
      }
    }
  });
  request.send();
};
