import { InputType, Field, ID } from '@nestjs/graphql';


@InputType()
export class CreateEmployeeInput {
  
    @Field()
    employee_Name : string

    @Field()
    monthly_budget : number

    @Field()
    company_id : number

    @Field()
    company_title : string
}