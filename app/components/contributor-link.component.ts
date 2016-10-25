import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Contributor } from '../services/contributor';
import { ContributorService } from '../services/contributor.service';

@Component({
  moduleId: module.id,
  selector: 'my-contributor-link',
  templateUrl: '../templates/contributor-link.component.html'
})

export class ContributorLinkComponent implements OnInit {
  @Input() c_id: number;
  @Input() contributor: Contributor;

  constructor(
    private contributorService: ContributorService,
    private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.contributorService.getContributor(this.c_id)
      .then(contributor => this.contributor = contributor);
  }
}
