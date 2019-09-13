let currentURL = window.location.pathname.substring(1);

//$(`#${currentURL}-link`).addClass('')

$(window).ready(()=> {
    setIndicator($('.sidebar__link') )
    $(document).on('click', '.sidebar__link', (e)=> handleClick(e));
})

function setIndicator(arr) {
    for (let i = 0; i < arr.length; i++) {
        const pageID = arr[i].id;
        const pageURL = pageID.split('-')[0];
        if (pageURL === currentURL) {
            $(`#${pageID}`).children().addClass('sidebar__img--active')
            $(`#${pageID}`).children().removeClass('sidebar__img--inactive')
        }
        else {
            $(`#${pageID}`).children().addClass('sidebar__img--inactive')
            $(`#${pageID}`).children().removeClass('sidebar__img--active') 
        }
    }
}

function handleClick(e) {
    const clickedId = e.target.id || $(e.target).parents('.sidebar__link').attr('id');
    currentURL = clickedId.split('-')[0];
    setIndicator($('.sidebar__link') )
}
