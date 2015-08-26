<?php

namespace modules\directory\models\search;

use modules\directory\models\PlacementType;
use yii\data\ActiveDataProvider;


class PlacementTypeSearch extends PlacementType
{

    public function rules()
    {
        return [
            [['id', 'name'], 'safe'],
        ];
    }

    public function search($params = null){
        $query = self::find();
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $query->lang();

        $dataProvider->setSort([
            'attributes' => [
                'id',
                'name' => [
                    'asc' => ['placement_type_lang.name' => SORT_ASC],
                    'desc' => ['placement_type_lang.name' => SORT_DESC],
                    'default' => SORT_ASC
                ]
            ]
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere(['=', 'placement_type.id', $this->id]);

        $query->innerJoinWith(['placementTypeLangs' => function ($q) {
            if($this->name)
                $query->andFilterWhere(['LIKE', 'placement_type_lang.name' . $this->name]);
        }]);

        return $dataProvider;
    }

}