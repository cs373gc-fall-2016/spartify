import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Language } from '../services/language';
import { LanguageService } from '../services/language.service';

@Component({
  moduleId: module.id,
  selector: 'my-language-link',
  templateUrl: '../templates/language-link.component.html'
})

export class LanguageLinkComponent implements OnInit {
  @Input() l_id: number;
  @Input() language: Language;

  constructor(
    private languageService: LanguageService,
    private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.languageService.getLanguage(this.l_id)
      .then(language => this.language = language);
  }
}
