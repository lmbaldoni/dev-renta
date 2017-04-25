import { DialogsService } from './dialogs.service';
import { MaterialModule } from '@angular/material';
import { NgModule } from '@angular/core';

import { ConfirmDialog }   from './confirm-dialog.component';

@NgModule({
    imports: [
        MaterialModule.forRoot(),
    ],
    exports: [
        ConfirmDialog,
    ],
    declarations: [
        ConfirmDialog,
    ],
    providers: [
        DialogsService,
    ],
    entryComponents: [
        ConfirmDialog,
    ],
})
export class DialogsModule { }