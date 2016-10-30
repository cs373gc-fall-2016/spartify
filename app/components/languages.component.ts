import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Language } from "../services/language";
import { LanguageService} from "../services/language.service";

@Component({
  moduleId: module.id,
  selector: 'languages',
  templateUrl: '../templates/languages.component.html'
})

export class LanguagesComponent implements OnInit {
  languages: Language[] = [];

  constructor(
    private router: Router,
    private languageService: LanguageService) {
  }

  ngOnInit(): void {
    this.languageService.getLanguages()
      .then(languages => this.languages = languages);
  }
}
