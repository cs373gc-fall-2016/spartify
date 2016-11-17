import { Pipe } from '@angular/core';

@Pipe({
    name: 'bold'
})
export class BoldPipe {
    transform(val:string, substrings:string[]) {
        if (substrings === undefined) {
            return val;
        }
        if (val != null && substrings != null) {
            val = val.toString();
            let i = 0;
            for (i = 0; i < substrings.length; i++) {
                val = val.replace(new RegExp('(' + substrings[i] + ')', 'gi'), `<b class="search">$1</b>`);
            }
        }
        return val;
    }
}