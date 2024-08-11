document.addEventListener('DOMContentLoaded', function () {
    document.getElementById("defaultOpen").click();
});

function loadTabContent(tabFile) {
    var container = document.getElementById("tabcontent-container");

    fetch(tabFile)
        .then(response => response.text())
        .then(data => {
            container.innerHTML = data;
            setActiveTab(tabFile);
        })
        .catch(error => console.error('Error al cargar la pestaña:', error));
}

function setActiveTab(tabFile) {
    var tablinks = document.getElementsByClassName("tablinks");

    for (var i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    var activeButton = document.querySelector(`button[onclick="loadTabContent('${tabFile}')"]`);
    if (activeButton) {
        activeButton.className += " active";
    }
}

function closeMenu() {
    document.getElementById("menu").classList.add("hidden");
    setCursorVisibility(false);
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({})
    });
}

function toggleMenu() {
    var menu = document.getElementById("menu");
    if (menu.classList.contains("hidden")) {
        menu.classList.remove("hidden");
        setCursorVisibility(true);
    } else {
        closeMenu();
    }
}

function prevSlide() {
    var carousel = document.querySelector('.carousel-inner');
    carousel.scrollBy({
        left: -340,
        behavior: 'smooth'
    });
}

function nextSlide() {
    var carousel = document.querySelector('.carousel-inner');
    carousel.scrollBy({
        left: 340,
        behavior: 'smooth'
    });
}

function setCursorVisibility(visible) {
    fetch(`https://${GetParentResourceName()}/cursor`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({ visible })
    });
}
