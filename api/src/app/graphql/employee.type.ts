import { ObjectType, Field } from '@nestjs/graphql';

@ObjectType('employeeByMonth')
export class EmployeeType {



    @Field()
    employee_Name : string

    @Field()
    employee_id : number


    @Field()
  company_title : string

  @Field()
  monthly_budget : number
  @Field()
  spent : number
  

   

}