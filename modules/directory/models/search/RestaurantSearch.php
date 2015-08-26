<?php

namespace modules\directory\models\search;


use modules\directory\models\Restaurant;
use yii\data\ActiveDataProvider;

class RestaurantSearch extends Restaurant
{
    public function rules()
    {
        return [
            [['id', 'name'], 'safe'],
        ];
    }

    public function search($params = null)
    {
        $query = self::find();
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $query->lang();

        $dataProvider->setSort([
            'attributes' => [
                'id',
                'name' => [
                    'asc' => ['restaurant_lang.name' => SORT_ASC],
                    'desc' => ['restaurant_lang.name' => SORT_DESC],
                    'default' => SORT_ASC
                ],
            ]
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere(['=', 'restaurant.id', $this->id]);

        $query->innerJoinWith(['restaurantLangs' => function ($q) {
            if ($this->name)
                $query->andFilterWhere(['LIKE', 'restaurant_lang.name' . $this->name]);
        }]);

        return $dataProvider;
    }
}
