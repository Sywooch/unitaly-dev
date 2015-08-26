<?php

namespace modules\directory\models;

use Yii;

/**
 * This is the model class for table "room_service".
 *
 * @property integer $id
 * @property integer $room_id
 * @property integer $service_id
 * @property integer $include
 * @property string $price
 * @property integer $active
 *
 * @property AdditionalService $service
 * @property Room $room
 */
class RoomService extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'room_service';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['room_id', 'service_id'], 'required'],
            [['room_id', 'service_id', 'include', 'active'], 'integer'],
            [['price'], 'number'],
            [['price', 'include'], 'safe'],
            [['room_id', 'service_id'], 'unique', 'targetAttribute' => ['room_id', 'service_id'], 'message' => 'The combination of Room ID and Service ID has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('room_service', 'ID'),
            'room_id' => Yii::t('room_service', 'Room ID'),
            'service_id' => Yii::t('room_service', 'Service ID'),
            'active' => Yii::t('room_service', 'Active'),
            'price' => Yii::t('room_service', 'Price'),
            'include' => Yii::t('room_service', 'Include'),
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
    public function getRoom()
    {
        return $this->hasOne(Room::className(), ['id' => 'room_id']);
    }

    /**
     * @inheritdoc
     * @return \modules\directory\models\query\RoomServiceQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \modules\directory\models\query\RoomServiceQuery(get_called_class());
    }
}
