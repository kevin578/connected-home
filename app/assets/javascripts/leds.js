//17, 25 16
function turnOn(led) {
  fetch("/led/turn_on", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json"
    },
    body: JSON.stringify({ led })
  });
}

function turnOff(led) {
  fetch("/led/turn_off", {
    method: "POST",
    body: JSON.stringify({ led }),
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json"
    }
  });
}

function loopLeds(runLoop) {
  fetch("/led/loopleds", {
    method: "POST",
    body: JSON.stringify({ runLoop }),
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json"
    }
  });
}

function stopLoop() {
  fetch("/led/stoploop", {
    method: "POST"
  });
}

$(window).ready(() => {
  $("#ledPauseInput").change(e => {
    $("#ledPauseValue").html(e.target.value);
    fetch("/led/changepausevalue", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: JSON.stringify({
        pauseValue: e.target.value
      })
    });
  });
});
