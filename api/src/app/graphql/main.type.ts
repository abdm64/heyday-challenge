import { ObjectType, Field } from '@nestjs/graphql';

@ObjectType('Employee')
export class EmployeeType {



    @Field()
    employee_id: number

    @Field()
    employee_Name : string

    @Field()
    monthly_budget : number

    @Field()
    month : string

    @Field()
    spend : string
    @Field()
    free_tax : boolean

}