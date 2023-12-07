import consumer from "channels/consumer"

if(location.pathname.match(/\/questions\/\d/)){

  consumer.subscriptions.create({
    channel: "AnswerChannel",
    question_id: location.pathname.match(/\d+/)[0]
  },  {

  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
        <div class="answer">
          <p class="user-info">${data.user.nickname}: </p>
          <p>${data.answer.text}</p>
        </div>`
      const answers = document.getElementById("answers")
      answers.insertAdjacentHTML('beforeend', html)
      const answerForm = document.getElementById("answer-form")
      answerForm.reset();
  }
});
}