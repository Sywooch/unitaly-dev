<?php

namespace modules\directory\models\search;

use modules\directory\Module as DirectoryModule;
use modules\directory\models\AdditionalService;
use modules\directory\models\RoomService;

class RoomServiceSearch extends AdditionalService
{
    public $roomId;

    public function getRoomService(){
        return RoomService::find()->where([
            'service_id' => $this->id,
            'room_id' => $this->roomId,
        ])->one();
    }

    public function getRoomInclude(){
        $roomService = $this->getRoomService();
        return $roomService ? $roomService->include : 0;
    }

    public function getRoomPrice(){
        $roomService = $this->getRoomService();
        return $roomService ? $roomService->price : null;
    }

    public function getRoomActive(){
        $roomService = $this->getRoomService();
        return $roomService ? $roomService->active : 0;
    }

    public function attributeLabels(){
        return [
            'roomInclude' => DirectoryModule::t('room', 'INCLUDE'),
            'roomActive' => DirectoryModule::t('room', 'ACTIVE'),
            'roomPrice' => DirectoryModule::t('room', 'PRICE'),
            'name' => DirectoryModule::t('room', 'SERVICE_NAME'),
        ];
    }
}