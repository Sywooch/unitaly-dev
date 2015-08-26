<?php

namespace modules\directory\models;

use Yii;

/**
 * This is the model class for table "placement_service".
 *
 * @property integer $id
 * @property integer $placement_id
 * @property integer $service_id
 * @property integer $include
 * @property string $price
 * @property integer $active
 *
 * @property AdditionalService $service
 * @property Placement $placement
 */
class PlacementService extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'placement_service';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['placement_id', 'service_id'], 'required'],
            [['placement_id', 'service_id', 'include', 'active'], 'integer'],
            [['price'], 'number'],
            [['price', 'include'], 'safe'],
            [['placement_id', 'service_id'], 'unique', 'targetAttribute' => ['placement_id', 'service_id'], 'message' => 'The combination of Placement ID and Service ID has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('placement_service', 'ID'),
            'placement_id' => Yii::t('placement_service', 'Placement ID'),
            'service_id' => Yii::t('placement_service', 'Service ID'),
            'active' => Yii::t('placement_service', 'Active'),
            'price' => Yii::t('placement_service', 'Price'),
            'include' => Yii::t('placement_service', 'Include'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getService()
    {
        return $this->hasOne(AdditionalService::className(), ['id' => 'service_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlacement()
    {
        return $this->hasOne(Placement::className(), ['id' => 'placement_id']);
    }

    /**
     * @inheritdoc
     * @return \modules\directory\models\query\PlacementServiceQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \modules\directory\models\query\PlacementServiceQuery(get_called_class());
    }
}
