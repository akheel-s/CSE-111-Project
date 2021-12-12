import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { AccuraciesService } from './accuracies.service';
import { CreateAccuracyDto } from './dto/create-accuracy.dto';
import { UpdateAccuracyDto } from './dto/update-accuracy.dto';

@Controller('accuracies')
@ApiTags('accuracies')
export class AccuraciesController {
  constructor(private readonly accuraciesService: AccuraciesService) {}

  @Post()
  create(@Body() createAccuracyDto: CreateAccuracyDto) {
    return this.accuraciesService.create(createAccuracyDto);
  }

  @Get()
  findAll() {
    return this.accuraciesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.accuraciesService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateAccuracyDto: UpdateAccuracyDto,
  ) {
    return this.accuraciesService.update(+id, updateAccuracyDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.accuraciesService.remove(+id);
  }
}
