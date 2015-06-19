var myMap, myPlacemark;
ymaps.ready(init);
var count = 1;

function init() {
    myMap = new ymaps.Map("map", {
        center: [59.939095, 30.315868],
        zoom: 10,
        controls: ['zoomControl', 'typeSelector']
    });
    checkedCat();
    $('.categories_class input').on('change', function() {
        if ($(this).prop("checked")) {
            // pointsAdd($(this).attr('id'));
            pointsss($(this).attr('id'))
        } else {
            pointsRemove($(this).attr('id'))
        };
    })

    function checkedCat() {
        getgetget(42);
    }

    function pointsRemove(catalogid) {
        // myMap.geoObjects.remove(objectManager);
        // $.ajax({
        //     url: "http://test.animallife.ru/udata://catalog/getMapObject/0/" + catalogid + "/5000/0/0.json"
        // }).done(function(data) {
        //     objectManager.remove(data);
        // });
        objectManager.setFilter(function(object) {
            // console.log(object.properties.catid);
            return object.properties.catid != catalogid;
        })
    }

    function pointsss(catalogid) {
        objectManager.setFilter(function(object) {
            // console.log(catalogid);
            return object.properties.catid in catalogid;
        })
    }

    function pointsAdd(catalogid) {
        objectManager = new ymaps.ObjectManager({
            clusterize: true,
            geoObjectOpenBalloonOnClick: true,
            clusterOpenBalloonOnClick: true
        });
        myMap.geoObjects.add(objectManager);
        $.ajax({
            url: location + "/udata://catalog/getMapObject/0/" + catalogid + "/5000/0/0.json"
        }).done(function(data) {
            objectManager.add(data);
            count++;
        });

    }

    function getgetget(catalogid) {
        objectManager = new ymaps.ObjectManager({
            clusterize: true,
            geoObjectOpenBalloonOnClick: true,
            clusterOpenBalloonOnClick: true
        });
        // objectManager.objects.options.set('preset', 'islands#greenDotIcon');
        myMap.geoObjects.add(objectManager);
        $.ajax({
            url: location + "/udata://catalog/getgetget/0/" + catalogid + "/5000/0/0.json"
        }).done(function(data) {
            objectManager.add(data);
        });
    }
}
// function drawPoint() {
//     myMap.geoObjects.each(function(context) {
//         myMap.geoObjects.remove(context);
//     });
//     $('#points li.OnMap').each(function(key, value) {
//         var myGeocoder = ymaps.geocode($(value).text());
//         myGeocoder.then(
//             function(res) {
//                 myMap.geoObjects.add(res.geoObjects);
//             }
//         );
//     });
// }
// $(document).ready(function() {
//         // drawPoint();
//     $('.categories_class').on('change', 'input', function() {
//         $('#points li').removeClass('OnMap');
// // он лоад добавить класс
// // при клике удалить
// // при загрузке все чеком
//         $('.categories_class input:checked').each(function(key, value) {
//             // console.log(key);
//             // console.log(value);
//             var parentId = $(value).attr('id');
//             $('#points li[data-parent-id=' + parentId + ']').addClass('OnMap');
//         })
//         drawPoint();
//     });
// });
// $(function() {
// })
