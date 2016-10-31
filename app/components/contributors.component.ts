import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LazyLoadEvent } from "primeng/components/common/api";

import { Contributor } from '../services/contributor';
import { ContributorService } from '../services/contributor.service';

@Component({
  moduleId: module.id,
  selector: 'contributors',
  templateUrl: '../templates/contributors.component.html'
})

export class ContributorsComponent implements OnInit {
  totalContributors = 0;
  contributors: Contributor[] = [];

  constructor(
    private router: Router,
    private contributorService: ContributorService) {
  }

  ngOnInit(): void {
    this.contributorService.getTotalContributors()
        .then(total => this.totalContributors= total)
    this.contributorService.getContributorRange(0, 5)
      .then(contributors => this.contributors = contributors);
  }

  loadData(event : LazyLoadEvent) {
    if (event.sortField) {
      this.contributorService.getSortedContributors(event.sortField, event.sortOrder, event.first, (event.first + event.rows))
          .then(contributors => this.contributors = contributors);
    } else {
      this.contributorService.getContributorRange(event.first, (event.first + event.rows))
          .then(contributors => this.contributors = contributors);
    }
  }
}
