import { AppService } from './../app.service';
import { RevenueType } from './../graphql/revenu.type';
import { NotFoundException } from '@nestjs/common';
import { Resolver, Mutation, Args, Query } from '@nestjs/graphql';





@Resolver(of => RevenueType)
export class RevenueResolver  {

    constructor(private _appService  : AppService){



    }


    @Query(returns => [RevenueType])
   getRevenueByPartner(){
   console.log('here')
       
        return   this._appService.getRevenueByPartner()
    }

   


}//
