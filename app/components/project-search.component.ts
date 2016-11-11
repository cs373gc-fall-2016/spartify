import {Component, Input, OnInit, OnChanges} from '@angular/core';

import { Project } from '../services/project';
import { ProjectService } from '../services/project.service';

@Component({
    moduleId: module.id,
    selector: 'my-project-search',
    templateUrl: '../templates/project-search.component.html'
})

export class ProjectSearchComponent implements OnChanges {
    @Input() tokens: string[];
    @Input() or_search: boolean = false;
    projects: Project[] = [];

    constructor(
        private projectService: ProjectService) {
    }

    ngOnChanges(): void {
        this.projectService.searchProjects(this.tokens, this.or_search)
            .then(projects => this.projects = projects);
    }
}