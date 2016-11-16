import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'my-splash',
  templateUrl: '../templates/splash.component.html'
})
export class SplashComponent {
  pics = [
    'app/img/needopensource.jpg', 'app/img/sky.jpg', 'app/img/google.jpg', 'app/img/msft.jpg', 'app/img/opensource.jpg'
  ];

  isActive(i : any) {
    return i === 0;
  }
}
