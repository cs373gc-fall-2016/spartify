import {Component, Input, OnInit, OnChanges} from '@angular/core';

import { Contributor } from '../services/contributor';
import { ContributorService } from '../services/contributor.service';

@Component({
    moduleId: module.id,
    selector: 'my-contributor-search',
    templateUrl: '../templates/contributor-search.component.html'
})

export class ContributorSearchComponent implements OnChanges {
    @Input() tokens: string[];
    @Input() or_search: boolean = false;
    contributors: Contributor[] = [];

    constructor(
        private contributorService: ContributorService) {
    }

    ngOnChanges(): void {
        this.contributorService.searchContributors(this.tokens, this.or_search)
            .then(contributors => this.contributors = contributors);
    }
}