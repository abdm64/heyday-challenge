import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { typeOrmConfig  } from './config/typeorm.config';
import { EmployeeModule } from './employee/employee.module';
import { GraphQLModule } from '@nestjs/graphql'
import { MainModule } from './app/main.module'



@Module({
  imports: [
    TypeOrmModule.forRoot(typeOrmConfig ), 
    EmployeeModule,
    GraphQLModule.forRoot({
      autoSchemaFile: true,
    }),
     MainModule
  
  
  
  ],
 
})
export class AppModule {}
