import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { SplashComponent } from './components/dashboard.component';
import { CompaniesComponent } from './components/companies.component';
import { CompanyDetailComponent } from "./components/company-detail.component";
import { ProjectsComponent } from './components/projects.component';
import { ProjectDetailComponent } from "./components/project-detail.component";
import { ContributorsComponent } from './components/contributors.component';
import { ContributorDetailComponent } from "./components/contributor-detail.component";
import { LanguagesComponent } from './components/languages.component';
import { LanguageDetailComponent } from './components/language-detail.component';
import { AboutComponent } from './components/about.component';
import { DbSearchComponent } from "./components/dbsearch.component";




const routes: Routes = [
  {
    path: '',
    component: SplashComponent
  },
  {
    path: 'companies',
    component: CompaniesComponent
  },
  {
    path: 'companies/:id',
    component: CompanyDetailComponent
  },
  {
    path: 'projects',
    component: ProjectsComponent
  },
  {
    path: 'projects/:id',
    component: ProjectDetailComponent
  },
  {
    path: 'contributors',
    component: ContributorsComponent
  },
  {
    path: 'contributors/:id',
    component: ContributorDetailComponent
  },
  {
    path: 'languages',
    component: LanguagesComponent
  },
  {
    path: 'languages/:id',
    component: LanguageDetailComponent
  },
  {
    path: 'about',
    component: AboutComponent
  },
  {
    path: 'search/:query',
    component: DbSearchComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

export const routedComponents = [SplashComponent, AboutComponent, DbSearchComponent,
                                 CompaniesComponent, CompanyDetailComponent,
                                 ProjectsComponent, ProjectDetailComponent,
                                 ContributorsComponent, ContributorDetailComponent,
                                 LanguagesComponent, LanguageDetailComponent];
