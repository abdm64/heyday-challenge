import { ObjectType, Field } from '@nestjs/graphql';

@ObjectType('tax')
export class TaxType {



    @Field()
    employee_id : number

    @Field()
    employee_Name : string

    @Field()
    monthly_budget : number

    @Field()
    month: number
    @Field()
    spent : number


    @Field()
     tax : number

     @Field()
     net : number

     @Field()
     freetaxlimit : number

     @Field()
     overTaxLimit : number

    

   

}