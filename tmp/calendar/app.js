function updateSched(id,act,start,end,cancelfun) {
  console.log("update ",id,start,end);
  $.ajax({
    type: "POST",
    url: "/schedule/update",
    data: {
      id:id,
      action: act,
      start: start.toJSON(),
      end: end.toJSON()
    },
    success: function(e) {
      console.log("success",e);
      if(e.success) {
        //all ok
      }else{
        cancelfun();
      } },
    fail: function() { console.log("fail"); cancelfun(); },
    error: function() { console.log("error"); cancelfun(); }
  });
};

function draw_calendar(){
  $('.wfid_calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'agendaDay,agendaWeek,month'
    },
    allDaySlot: false,
    defaultView: 'agendaWeek',
    //defaultDate: '2018-03-12',
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    locale: "ru",
    firstDay: 1,
    eventOverlap: false,
    snapDuration: "00:05",
    minTime: "08:00:00",
    maxTime: "22:00:00",

    eventDrop: function(e, j, u, r){
      console.log("eventDrop",e);
      updateSched(e.id,"move",e.start._d,e.end._d,u);
    },
    eventResize: function(e, d, r, j, u, v ){
      console.log("Resize",e);
      updateSched(e.id,"resize",e.start._d,e.end._d,r);
    },
    /*
    droppable: true,
    drop: function(e,a,b,c) {
      console.log("drop e",e);
      console.log("drop a",a);
      console.log("drop b",b);
      console.log("drop c",c);
      // is the "remove after drop" checkbox checked?
      //if ($('#drop-remove').is(':checked')) {
        //                   // if so, remove the element from the "Draggable Events" list
        //$(this).remove();
      //}
    },
    */
    selectable: true,
    selectHelper: true,
    select: function(start, end) {
      console.log(start,end);
      if (confirm("Создать приём c "+start+" "+end+"?")){
        window.location="/schedule/edit/new?start="+start.toJSON()+"&end="+end.toJSON();
      } 
          /*
      var title = prompt('Event Title:');
      var eventData;
      if (title) {
        eventData = {
          title: title,
          start: start,
          end: end
        };
        $('.wfid_calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
      }
      */
      $('.wfid_calendar').fullCalendar('unselect');
    },

    events: {
      url: '/schedule/view',
      error: function(e) {
        alert(e);
      }
    }
    //  [
    //{ id: 999, title: 'Repeating Event', start: '2018-03-16T16:00:00', end: '2018-03-16T18:10:00' },
    //{ title: 'Meeting', start: '2018-03-12T10:30:00', end: '2018-03-12T12:30:00' },
    //{ title: 'Lunch', start: '2018-03-12T12:00:00', end: '2018-03-12T13:00:00' },
    //{ title: 'Click for Google', url: 'http://google.com/', start: '2018-03-28T12:00:00', end: '2018-03-28T13:00:00' }
    //]
  }); 
  $(".fc-evsrc").data('event', {
    title: $.trim($(this).text()), // use the element's text as the event title
    stick: true // maintain when user navigates (see docs on the renderEvent method)
  });
  $(".fc-evsrc").draggable({
    zIndex: 999,
    revert: true,
    revertDuration: 0
  });
};


