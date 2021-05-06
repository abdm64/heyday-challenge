import { EmployeeType } from '../graphql/employee.type';
import { AppService } from './../app.service';
import { Resolver, Mutation, Args, Query } from '@nestjs/graphql';





@Resolver(of => EmployeeType)
export class EmployeeResolver  {

    constructor(private _appService  : AppService){



    }


    @Query(returns => [EmployeeType])
   getEmployeeByMonth(

    @Args('month')  month : number
   ){
   
       
        return   this._appService.getEmployeeByMonth(month)
    }

   


}//
