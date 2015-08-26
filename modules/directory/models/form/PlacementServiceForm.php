<?php

namespace modules\directory\models\form;


use modules\directory\models\search\AdditionalServiceSearch;
use modules\directory\models\search\PlacementServiceSearch;
use modules\directory\models\PlacementService;
use yii\data\ActiveDataProvider;

class PlacementServiceForm extends PlacementService
{

    public $serviceTypeId;

    public $placementId;

    public function search(){
        $query = PlacementServiceSearch::find()->where([
            'service_type_id' => $this->serviceTypeId
        ]);
        $query->indexBy('id');
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
        return $dataProvider;
    }
}