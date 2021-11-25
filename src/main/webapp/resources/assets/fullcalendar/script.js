function callApiService (url, jsonData, method) {
  if (method === 'GET') {
    $.ajax({
      url,
      type: 'GET',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify(jsonData),
      success: function(response){
        if (response) {
          alert('if invoked')
          return response
        } else {
          alert('else invoked')
          return false
        }
      },
      error: function (request, status, error){
        console.log(error)
      }
    })
  } else if (method === 'POST') {
    $.ajax({
      url : url,
      type: 'POST',
      dataType: 'json',
      contentType: 'application/json',
      data: JSON.stringify(jsonData),
      success: function(response){
        if (response) {
          alert('if invoked')
          return true 
        } else {
          alert('else invoked')
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
  return callApiService('/yesol', null, 'GET')
}

function setFullCalendarData (studyNum, updateData) {
  setData = {
    studyNum: studyNum,
    callendarData: JSON.stringify(updateData),
  }

  return callApiService('/calendar/add', setData, 'POST')
}

function exmapleData () {
  return []
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
      end:"2021-11-15",
      wow:"wow?"
    },
  ];
}