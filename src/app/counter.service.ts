import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import * as Web3 from 'web3';

@Injectable()
export class CounterService {

  web3: any;
  CounterContract: any;
  contractInstance: any;
  count: number;
  lastTransactionID: any;
  
  constructor(private http: Http) {

    this.lastTransactionID = '';
    this.http.get('assets/abiDefinition.json').subscribe(abi => {
      
      this.web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));
      
      this.CounterContract = this.web3.eth.contract(abi.json());
      
      this.contractInstance = this.CounterContract.at('0x6388ae4ee1564f18a744c19f9a708caa8d0bffe2');
      
      
     
    });
  }
addCandidate(da) {
   
    this.contractInstance.addCandidate(da.name,da.emailid,{from:this.web3.eth.accounts[0],gas:3000000},this.handler.bind(this));
    
  }

  handler(error, result) {
    
    this.lastTransactionID = result;
  }

}
