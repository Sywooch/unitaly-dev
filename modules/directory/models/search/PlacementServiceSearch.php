<?php

namespace modules\directory\models\search;

use modules\directory\Module as DirectoryModule;
use modules\directory\models\AdditionalService;
use modules\directory\models\PlacementService;

class PlacementServiceSearch extends AdditionalService
{
    public $placementId;

    public function getPlacementService(){
        return PlacementService::find()->where([
            'service_id' => $this->id,
            'placement_id' => $this->placementId,
        ])->one();
    }

    public function getPlacementInclude(){
        $placementService = $this->getPlacementService();
        return $placementService ? $placementService->include : 0;
    }

    public function getPlacementPrice(){
        $placementService = $this->getPlacementService();
        return $placementService ? $placementService->price : null;
    }

    public function getPlacementActive(){
        $placementService = $this->getPlacementService();
        return $placementService ? $placementService->active : 0;
    }

    public function attributeLabels(){
        return [
            'placementInclude' => DirectoryModule::t('placement', 'INCLUDE'),
            'placementActive' => DirectoryModule::t('placement', 'ACTIVE'),
            'placementPrice' => DirectoryModule::t('placement', 'PRICE'),
            'name' => DirectoryModule::t('placement', 'SERVICE_NAME'),
        ];
    }
}