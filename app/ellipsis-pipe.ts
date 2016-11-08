import { Pipe } from '@angular/core';

@Pipe({
    name: 'ellipsis'
})
export class EllipsisPipe {
    transform(val:string, numchar:number) {
        if (numchar === undefined) {
            return val;
        }

        if (val != null && val.length > numchar) {
            return val.substring(0, numchar) + '...';
        } else {
            return val;
        }
    }
}