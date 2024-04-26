import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { FormlyModule } from '@ngx-formly/core';
import { FormlyBootstrapModule } from '@ngx-formly/bootstrap';
import { SearchCriteriaComponent } from './components/search-criteria/search-criteria.component';
import { SearchRoutingModule } from './search-routing.module';

@NgModule({
  declarations: [SearchCriteriaComponent],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormlyModule.forRoot(),
    FormlyBootstrapModule,
    SearchRoutingModule
  ]
})
export class SearchModule { }
