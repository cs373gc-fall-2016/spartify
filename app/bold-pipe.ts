import { Pipe } from '@angular/core';

@Pipe({
    name: 'bold'
})
export class BoldPipe {
    transform(val:string, substring:string) {
        if (substring === undefined) {
            return val;
        }

        if (val != null && substring != null) {
            return val.replace(new RegExp('('+substring+')', 'gi'), '<b>$1</b>');
        } else {
            return val;
        }
    }
}