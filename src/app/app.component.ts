import { Component } from '@angular/core';
import { OnInit } from '@angular/core/src/metadata/lifecycle_hooks';
import { CounterService } from './counter.service';




@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'ABC - Art Gallery   1st Annual Online Painting Competition.';


  model:any = {};
  name:string = '';
  can:any = [];
  constructor(private counterService: CounterService) {
  }

  ngOnInit() {
  
  }

 

  register(data) {
    
    this.counterService.addCandidate(data);
 }

 getpainter(){
   
 }
}
