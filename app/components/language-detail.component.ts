import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Language } from '../services/language';
import { LanguageService } from '../services/language.service';

@Component({
  moduleId: module.id,
  selector: 'my-language-detail',
  templateUrl: '../templates/language-detail.component.html'
})

export class LanguageDetailComponent implements OnInit {
  @Input() language: Language;
  @Output() close = new EventEmitter();
  error: any;
  navigated = false; // true if navigated here

  constructor(
    private languageService: LanguageService,
    private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.route.params.forEach((params: Params) => {
      if (params['id'] !== undefined) {
        let id = +params['id'];
        this.navigated = true;
        this.languageService.getLanguage(id)
          .then(language => this.language = language);
      } else {
        this.navigated = false;
        this.language = new Language();
      }
    });
  }

  save(): void {
    this.languageService
      .save(this.language)
      .then(language => {
        this.language = language; // saved language, w/ id if new
        this.goBack(language);
      })
      .catch(error => this.error = error); // TODO: Display error message
  }

  goBack(savedLanguage: Language = null): void {
    this.close.emit(savedLanguage);
    if (this.navigated) { window.history.back(); }
  }
}
