import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Contributor } from '../services/contributor';
import { ContributorService } from '../services/contributor.service';

@Component({
  moduleId: module.id,
  selector: 'contributors',
  templateUrl: '../templates/contributors.component.html'
})

export class ContributorsComponent implements OnInit {
  contributors: Contributor[] = [];

  constructor(
    private router: Router,
    private contributorService: ContributorService) {
  }

  ngOnInit(): void {
    this.contributorService.getContributors()
      .then(contributors => this.contributors = contributors);
  }
}
