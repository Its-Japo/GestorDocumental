import { Component } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { FormlyFieldConfig } from '@ngx-formly/core';
import { FormService } from '../../services/form.service';

@Component({
  selector: 'app-search-criteria',
  templateUrl: './search-criteria.component.html',
  styleUrl: './search-criteria.component.css'
})
export class SearchCriteriaComponent {
  form = new FormGroup({});
  model = {};
  fields: FormlyFieldConfig[];

  constructor(
    private formService: FormService
  ) {
    this.fields = formService.getFormConfig();
  }

  ngOnInit(): void {
  }

  onSubmit() {
    if (this.form.valid) {
      console.log(this.model);
    }
  }

  onSave() {
    // lógica para guardar la búsqueda
  }
}
