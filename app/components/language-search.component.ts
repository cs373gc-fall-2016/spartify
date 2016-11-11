import {Component, Input, OnInit, OnChanges} from '@angular/core';

import { Language } from '../services/language';
import { LanguageService } from '../services/language.service';

@Component({
    moduleId: module.id,
    selector: 'my-language-search',
    templateUrl: '../templates/language-search.component.html'
})

export class LanguageSearchComponent implements OnChanges {
    @Input() tokens: string[];
    @Input() or_search: boolean = false;
    languages: Language[] = [];

    constructor(
        private languageService: LanguageService) {
    }

    ngOnChanges(): void {
        this.languageService.searchLanguages(this.tokens, this.or_search)
            .then(languages => this.languages = languages);
    }
}