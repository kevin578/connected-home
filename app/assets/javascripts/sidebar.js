$(window).ready(()=> {
    $(document).on('click','.sidebar__link',(e)=> {
        console.log(window.location.pathname)
    })
})