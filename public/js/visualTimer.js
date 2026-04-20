//Set a time limit to 30000 and initilialize a value to store how much time is left
const timeLimit = 30000;
let remaining = timeLimit;

//Access our fields from the EJS
const bar = document.getElementById('timer-bar');
const label = document.getElementById('time-label');
const timeRemaining = document.getElementById("time-remaining-input")

//A function to generate the color of our timerbar depending on how far along it is
//Colors are obtained from the stylesheet
function getColor(progress){
    if(progress>0.50){
        return 'var(--timer-safe)';
    }else if (progress>0.25){
        return 'var(--timer-worry)';
    }
    return 'var(--timer-urgent)';
}

//Using an interval that checks every 5 ms to update information
const interval = setInterval(() => {
  //update time remaining and pass that value into the ejs form
  remaining -= 5;
  timeRemaining.value = remaining;
  //If out of time, submit the form.
  if (remaining <= 0) {
    remaining = 0;
    clearInterval(interval);
    document.getElementById('quiz-form').submit();
  }
  
  //Every 100 ms interval, reload the graphics
  if(remaining%100 === 0 && !(remaining===0)){
    const progress = remaining / timeLimit;
    bar.style.width = (progress * 100) + '%';
    bar.style.background = getColor(progress);
    label.textContent = (remaining/1000).toFixed(1);
  }

}, 5); 