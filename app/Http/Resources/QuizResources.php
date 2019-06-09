<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class QuizResources extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
        'id' => $this->id,
        'quiz' => $this->quiz,
        'thematic' => $this->thematic,
        'lesson' => $this->lesson,
        'data' => $this->data,
      ];
    }
}
