import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  moduleId: module.id,
  selector: 'my-app',
  templateUrl: '../templates/app-component.html'
})
export class AppComponent {

  constructor(private router: Router) {}

  performSearch(searchTerm: HTMLInputElement): void {
    let val:string = searchTerm.value.toLowerCase();
    searchTerm.value = null;
    if (val) {
      let link = ['/search', val];
      this.router.navigate(link);
    }
  }
}
