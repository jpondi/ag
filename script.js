

function createNode(element) {

    return document.createElement(element);

}



function append(parent, el) {

    return parent.appendChild(el);
}



const div = document.getElementById("authors");

const url = 'https://randomuser.me/api/?results=100';

fetch(url)

    .then((resp) => resp.json())

    .then(function (data) {



        let authors = data.results;

        return authors.map(function (author) {

            let p = createNode('p'), img = createNode('img'), span = createNode('span');

            img.src = author.picture.large;


            span.innerHTML = ` ${author.name.first} ${author.name.last}`;

            // append(li, img);

            // append(li, span);
            // append(p, img);
            // append(p, span);

            append(div, img);


        })


        })

            .catch(function (error) {


                console.log(JSON.stringify(error));
            });