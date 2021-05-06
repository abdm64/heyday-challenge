import { TaxType } from './../graphql/tax.type';

import { AppService } from './../app.service';
import { Resolver, Mutation, Args, Query } from '@nestjs/graphql';





@Resolver(of => TaxType)
export class TaxResolver  {

    constructor(private _appService  : AppService){



    }


    @Query(returns => [TaxType])
   getTaxInformationByCompanyId(

    @Args('company_id')  company_id : number
   ){
  
       
        return   this._appService.getTaxInformation(company_id)
    }

   


}//
