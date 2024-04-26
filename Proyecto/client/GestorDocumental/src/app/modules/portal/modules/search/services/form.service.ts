import { Injectable } from '@angular/core';
import { FormlyFieldConfig } from '@ngx-formly/core';

@Injectable({
  providedIn: 'root'
})
export class FormService {
  getFormConfig(): FormlyFieldConfig[] {
    return [
      {
        key: 'idLiquidacion',
        type: 'input',
        className: 'custom-input-class',
        templateOptions: {
          label: 'Id Liquidación',
          placeholder: 'Ingrese el ID de liquidación',
          required: true,
        },
      },
      // Más configuraciones de campos...
    ];
  }
}

