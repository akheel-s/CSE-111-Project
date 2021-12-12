import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { UserflashcardsService } from './userflashcards.service';
import { CreateUserflashcardDto } from './dto/create-userflashcard.dto';
import { UpdateUserflashcardDto } from './dto/update-userflashcard.dto';
import { ApiTags } from '@nestjs/swagger';

@Controller('userflashcards')
@ApiTags('userflashcards')
export class UserflashcardsController {
  constructor(private readonly userflashcardsService: UserflashcardsService) {}

  @Post()
  create(@Body() createUserflashcardDto: CreateUserflashcardDto) {
    return this.userflashcardsService.create(createUserflashcardDto);
  }

  @Get()
  findAll() {
    return this.userflashcardsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.userflashcardsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateUserflashcardDto: UpdateUserflashcardDto,
  ) {
    return this.userflashcardsService.update(+id, updateUserflashcardDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userflashcardsService.remove(+id);
  }
}
