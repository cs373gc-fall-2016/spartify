import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

@Component({
    moduleId: module.id,
    selector: 'my-dbsearch',
    templateUrl: '../templates/dbsearch.component.html'
})

export class DbSearchComponent {
    queries: string[];
    navigated = false; // true if navigated here

    constructor(
        private route: ActivatedRoute) {
    }

    ngOnInit(): void {
        this.route.params.forEach((params: Params) => {
            if (params['query'] !== undefined) {
                let query = params['query'];
                this.queries = query.split(' ');
                this.navigated = true;
            } else {
                this.navigated = false;
            }
        });
    }
}