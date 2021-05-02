import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { typeOrmConfig  } from './config/typeorm.config';
import { EmployeeModule } from './employee/employee.module';
import { GraphQLModule } from '@nestjs/graphql'
import { OrderModule } from './order/order.module';
import { VoucherModule } from './voucher/voucher.module';


@Module({
  imports: [
    TypeOrmModule.forRoot(typeOrmConfig ), 
    EmployeeModule,
    GraphQLModule.forRoot({
      autoSchemaFile: true,
    }),
    OrderModule,
    VoucherModule,
  
  
  
  ],
 
})
export class AppModule {}
