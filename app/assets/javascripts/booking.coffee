jQuery ->
    rooms = $('#booking_room_id').html()
    $('#booking_building_name').change ->
        building = $('#booking_building_name :selected').text()
        options = $(rooms).filter("optgroup[label='#{building}']").html()
        if options
            $('#booking_room_id').html(options)
        else
            $('#booking_room_id').empty()