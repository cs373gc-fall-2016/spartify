import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Contributor } from '../services/contributor';
import { ContributorService } from '../services/contributor.service';

@Component({
  moduleId: module.id,
  selector: 'my-contributor-detail',
  templateUrl: '../templates/contributor-detail.component.html'
})

export class ContributorDetailComponent implements OnInit {
  @Input() contributor: Contributor;
  @Output() close = new EventEmitter();
  error: any;
  navigated = false; // true if navigated here

  constructor(
    private contributorService: ContributorService,
    private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.route.params.forEach((params: Params) => {
      if (params['id'] !== undefined) {
        let id = +params['id'];
        this.navigated = true;
        this.contributorService.getContributor(id)
          .then(contributor => this.contributor = contributor);
      } else {
        this.navigated = false;
        this.contributor = new Contributor();
      }
    });
  }

  save(): void {
    this.contributorService
      .save(this.contributor)
      .then(contributor => {
        this.contributor = contributor; // saved contributor, w/ id if new
        this.goBack(contributor);
      })
      .catch(error => this.error = error); // TODO: Display error message
  }

  goBack(savedContributor: Contributor = null): void {
    this.close.emit(savedContributor);
    if (this.navigated) { window.history.back(); }
  }
}
