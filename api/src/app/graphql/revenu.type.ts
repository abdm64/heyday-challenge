import { ObjectType, Field } from '@nestjs/graphql';

@ObjectType()
export class RevenueType {



    @Field()
    partner_name: string

    @Field()
    revenue : string

   

}