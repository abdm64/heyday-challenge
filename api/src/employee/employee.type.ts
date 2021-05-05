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
    company_id : string

    @Field()
    company_title : string
    @Field()
    spent : string

}