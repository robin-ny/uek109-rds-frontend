function generateTableEntry(member){
  console.log()
  const children = [elt("td",member.firstname),elt("td",member.lastname),elt("td",(member.grade).toString())]
  document.getElementsByClassName("member-rows")[0].appendChild(elt("tr",children))
}

function elt (type, ...children) {
  let node = document.createElement(type)
  for (let child of children) {
    if (typeof child != "string") node.appendChild(child)
    else node.appendChild(document.createTextNode(child))
  }
  return node
}


const url = "http://localhost:3000";

function fetchMembers(){
    fetch(url, {
        method: "PUT",
        headers: { "Content-type": "application/json" },
        body: JSON.stringify({})
      })

        .then((response) => response.json())
        .then((data) => {
            data.members.forEach(generateTableEntry)
        })
        .catch((error) => {
          console.error(error);
        });
}

function updateDB(){}