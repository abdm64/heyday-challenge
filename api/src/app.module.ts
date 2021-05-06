import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { typeOrmConfig  } from './config/typeorm.config';

import { GraphQLModule } from '@nestjs/graphql'
import { MainModule } from './app/main.module'



@Module({
  imports: [
    TypeOrmModule.forRoot(typeOrmConfig ), 
    MainModule,
    GraphQLModule.forRoot({
      autoSchemaFile: true,
    }),

    
  
  
  
  ],
 
})
export class AppModule {}
