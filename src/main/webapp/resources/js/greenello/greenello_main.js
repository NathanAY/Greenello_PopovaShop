jQuery(function ($) {
    var panelList = $('#draggablePanelList');

    panelList.sortable({
        // Only make the .panel-heading child elements support dragging.
        // Omit this to make then entire <li>...</li> draggable.
        handle: '.panel-heading',
        update: function () {
            $('.panel', panelList).each(function (index, elem) {
                var $listItem = $(elem),
                    newIndex = $listItem.index();

                // Persist the new indices.
            });
        }
    });
});

jQuery(function ($) {
    var panelList2 = $('#draggablePanelList2');

    panelList2.sortable({
        // Only make the .panel-heading child elements support dragging.
        // Omit this to make then entire <li>...</li> draggable.
        handle: '.panel-heading',
        update: function () {
            $('.panel', panelList2).each(function (index, elem) {
                var $listItem = $(elem),
                    newIndex = $listItem.index();

                // Persist the new indices.
            });
        }
    });
});


// When the user clicks the button, open the modal
function openModal () {
    var modal = document.getElementById('myModal');
    modal.style.display = "block";
}

$(function ($) {
    $(".close").click(function () {
        console.warn("close")
        var modal = document.getElementById('myModal');
        modal.style.display = "none";
    });
});

function openCard(id) {
    var elementId = 'card-' + id;
    var modal = document.getElementById(elementId);
    modal.style.display = "block";
}

function closeCard(id) {
    var elementId = 'card-' + id;
    var modal = document.getElementById(elementId);
    modal.style.display = "none";
}

function backStatus(id) {
    console.warn("back: " + id);
    workflow(id, false);
    closeCard(id);
}

function nextStatus(id) {
    workflow(id, true);
    closeCard(id);
}

//History panel
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}