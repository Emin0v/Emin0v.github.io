// <div class="card border-warning mb-3" style="max-width: 18rem;">
//     <div class="card-header">Randevu Vaxtı</div>
//     <div class="card-body text-warning">
//         <h5 class="card-title">Warning card title</h5>
//         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
//     </div>
// </div>

if(`${appointments}`!==null){
    `${appointments}`.forEach(function(appointment){
        let information = `Saat ${appointment.appDate} da ...`;
        addCard(information);
    });

}

function addCard(information) {
    console.log("information" + information);
    if (information !== "") {
        const section = document.getElementById("hero");

        //card
        const card = document.createElement("div");
        card.className = "card border-warning mb-3";
        card.style = "max-width: 18rem;";

        const cardHead = document.createElement("div");
        cardHead.className = "card-header";
        cardHead.appendChild(document.createTextNode("Randevu Vaxtı"));

        const cardBody = document.createElement("div");
        cardBody.className = "card-body text-warning";
        //h5 tag
        const title = document.createElement("h5");
        title.className = "card-title";
        //p tag
        const info = document.createElement("p");
        info.className = "card-text";
        info.appendChild(document.createTextNode(information));

        //add div to cardbody
        cardBody.appendChild(title);
        cardBody.appendChild(info);

        //add cardheader and cardbody to card
        card.appendChild(cardHead);
        card.appendChild(cardBody);

        //add card to section
        section.appendChild(card);
    }

}


