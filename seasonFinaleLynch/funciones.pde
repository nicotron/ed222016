void tecLeft() {
  if (pantalla == 0) { 
    if (select != 0) {
      select -= 1;
      semanaDay -= 1;
      if ( semanaDay < 0) semanaDay = 6;
    }
  } else {
    if (weekS > 6) {
      weekS -=7;
      weekO -=7;
    }
  }
}

void tecRight() {
  if (pantalla == 0) { 
    if (select != 364) {
      select += 1; 
      semanaDay += 1;
      if ( semanaDay > 6) semanaDay = 0;
    }
  } else {
    if (weekS <357) {
      weekS +=7;
      weekO +=7;
    }
  }
}

void tecUp() {
  if (pantalla == 0) { 
    if (select > 5) { 
      select -= 6;
    }
  } else {
    if (weekS > 27) {
      weekS -=28;
      weekO -=28;
    }
  }
}

void tecDown() {
  if (pantalla == 0) { 
    if (select < 359) {
      select += 6;
    }
  } else {
    if (weekS < 323) {
      weekS +=28;
      weekO +=28;
    }
  }
}