function callApiService (url, data, method) {
  return
  if (method === 'GET') {
    $.ajax({
      url,
      type: 'GET',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify(jsonData),
      success: function(response){
        if (response) {
          alert('goongdoong smell is good!')
          return true
        } else {
          alert('wooo weck!')
          return false
        }
      },
      error: function (request, status, error){
        console.log(error)
      }
    })
  } else if (method === 'POST') {
    $.ajax({
      url,
      type: 'POST',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify(jsonData),
      success: function(response){
        if (response) {
          alert('goongdoong smell is dirty!')
          return true 
        } else {
          alert('wooo weck!')
          return false
        }
      },
      error: function (request, status, error){
        console.log(error)
      }
    })
  }
}

function getFullCalendarData () {
  return callApiService('/yeshow/goong~doong/smell', null, 'GET')
}

function setFullCalendarData (data) {
  return callApiService('/yeshow/goong~doong/dirty', data, 'POST')
}

function exmapleData () {
  return [
    {
      title: "All Day Event",
      start: "2021-11-01",
    },
    {
      title: "Long Event",
      start: "2021-11-07",
      end: "2021-11-10",
    },
    {
      groupId: "999",
      title: "Repeating Event",
      start: "2021-11-09T16:00:00",
      end: "2021-11-11",
    },
    {
      groupId: "999",
      title: "Repeating Event",
      start: "2021-11-16T16:00:00",
      end: "2021-11-17T20:00:00",
    },
    {
      title: "Conference",
      start: "2021-11-11",
      end: "2021-11-13",
    },
    {
      title: "Conference",
      start: "2021-11-20",
      end: "2021-11-22",
    },
    {
      title: "Meeting2",
      start: "2021-11-21T10:30:00",
      end: "2021-11-21T12:30:00",
    },
    {
      title: "Meeting",
      start: "2021-11-12T10:30:00",
      end: "2021-11-12T12:30:00",
    },
    {
      title: "Lunch",
      start: "2021-11-12T12:00:00",
    },
    {
      title: "Meeting",
      start: "2021-11-12T14:30:00",
    },
    {
      title: "Birthday Party",
      start: "2021-11-13T07:00:00",
    },
    {
      title: "Click for Google",
      url: "http://google.com/",
      start: "2021-11-28",
    },
    {
      title: "yesoltest",
      start: "2021-11-14",
      end:"2021-11-15"
    },
  ];
}