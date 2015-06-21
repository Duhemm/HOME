
function runWithString(string) {
  return go(string);
}

function runWithItem(item) {
  return go(item.title);
}

function go(input) {

  parts = input.split(' ');
  delay = parts.pop();
  text  = parts.join(' ');

  LaunchBar.displayNotification({
    'title' : 'Time\'s up !',
    'string': text,
    'delay' : delay
  });

}
