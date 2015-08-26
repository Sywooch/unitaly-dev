<?php

namespace modules\directory\models\form;


use modules\directory\models\search\AdditionalServiceSearch;
use modules\directory\models\search\RoomServiceSearch;
use modules\directory\models\RoomService;
use yii\data\ActiveDataProvider;

class RoomServiceForm extends RoomService
{

    public $serviceTypeId;

    public $roomId;

    public function search(){
        $query = RoomServiceSearch::find()->where([
            'service_type_id' => $this->serviceTypeId
        ]);
        $query->indexBy('id');
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
        return $dataProvider;
    }
}