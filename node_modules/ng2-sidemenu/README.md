### markup
```html
<div class="sidemenu-wrapper" [ngStyle]="sidemenuStyle">
  <ng-sidemenu [data]="categoryMap"></ng-sidemenu>
</div>
```

### typescript
```typescript
import {Component} from 'angular2/core';
import {CORE_DIRECTIVES, FORM_DIRECTIVES, NgClass} from 'angular2/common';
import {ButtonCheckbox} from 'ng2-bootstrap/ng2-bootstrap';
import {SIDEMENU_DIRECTIVES} from '../../../ng2-sidemenu';

// webpack html imports
let template = require('./sidemenu-demo.html');

@Component({
  selector: 'sidemenu-demo',
  template: template,
  directives: [NgClass, CORE_DIRECTIVES, FORM_DIRECTIVES, ButtonCheckbox, SIDEMENU_DIRECTIVES]
})
export class SidemenuDemoComponent {
  public sidemenuStyle:any = {
    height: '1400px',
    position: 'relative'
  };
  public categoryMap: { [category: string]: any[]} = {
      sorting: [{
        label: 'insertion',
        text: 'Insertion Sort'
      }, {
        label: 'selection',
        text: 'Selection Sort'
      }, {
        label: 'bubble',
        text: 'Bubble Sort'
      }, {
        label: 'merge',
        text: 'Merge Sort'
      }, {
        label: 'quick',
        text: 'Quick Sort'
      }, {
        label: 'heap',
        text: 'Heap Sort'
      }],
      search: [{
        label: 'binary search',
        text: 'Binary Search'
      }],
      string: [{
        label: 'edit distance',
        text: 'Edit Distance'
      }, {
        label: 'suffix array',
        text: 'Suffix Array'
      }],
      greey: [{
        label: 'job scheduling',
        text: 'Job Scheduling'
      }],
      graph: [{
        label: 'bfs',
        text: 'Breadth First Search'
      }, {
        label: 'dfs',
        text: 'Depth First Search'
      }]
    };
}
```
