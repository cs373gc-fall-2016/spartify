import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LazyLoadEvent } from "primeng/components/common/api";

import { Language } from "../services/language";
import { LanguageService} from "../services/language.service";

@Component({
  moduleId: module.id,
  selector: 'languages',
  templateUrl: '../templates/languages.component.html'
})

export class LanguagesComponent implements OnInit {
  totalLanguages = 0;
  languages: Language[] = [];

  constructor(
    private router: Router,
    private languageService: LanguageService) {
  }

  ngOnInit(): void {
    this.languageService.getTotalLanguages()
        .then(total => this.totalLanguages= total)
    this.languageService.getLanguageRange(0,5)
      .then(languages => this.languages = languages);
  }

  loadData(event : LazyLoadEvent) {
    if (event.sortField) {
      this.languageService.getSortedLanguages(event.sortField, event.sortOrder, event.first, (event.first + event.rows))
          .then(contributors => this.languages = contributors);
    } else {
      this.languageService.getLanguageRange(event.first, (event.first + event.rows))
          .then(contributors => this.languages = contributors);
    }
  }
}
