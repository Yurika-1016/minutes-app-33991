if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
document.addEventListener("DOMContentLoaded", function(){
  const toDoListsLists=document.getElementById("to_do_lists_lists");
  const createToDoList = () => {
    const toDoListElement = document.createElement('div')
    toDoListElement.setAttribute('class', "to_do_list_element")
    let toDoListElementNum =document.querySelectorAll(".to_do_list_element").length

    const inputHTML=document.createElement('input')
    inputHTML.setAttribute('id', `minute_to_do_lists_${toDoListElementNum}`)
    inputHTML.setAttribute('name', 'minute[to_do_lists][]')
    inputHTML.setAttribute('type','text')

    toDoListElement.appendChild(inputHTML)
    toDoListsLists.appendChild(toDoListElement)

    inputHTML.addEventListener('change', (e) =>{
      blob = window.URL.createObjectURL(text)
      createToDoList(blob)
    })
  }
  document.getElementById('minute_to_do_lists').addEventListener('change', (e) => {
    console.log(e)
    //let blob = window.URL.createObjectURL(text);
  
    //createImageHTML(blob)
  })
});
}