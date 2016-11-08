import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'my-splash',
  templateUrl: '../templates/splash.component.html'
})
export class SplashComponent {
  count = 0;
  pics = [
    'app/img/google.jpg', 'app/img/msft.jpg', 'app/img/fb.jpeg'
  ];

  isActive() {
    if (this.count === 0) {
      this.count = 1;
      return true;
    } else {
      return false;
    }
  }
}
