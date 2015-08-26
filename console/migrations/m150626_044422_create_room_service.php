<?php

use yii\db\Schema;
use yii\db\Migration;

class m150626_044422_create_room_service extends Migration
{
    public function up()
    {
        $this->createTable('room_service', [
            'id' => 'pk',
            'room_id' => Schema::TYPE_INTEGER .' NOT NULL',
            'service_id' => Schema::TYPE_INTEGER .' NOT NULL',
            'active' => Schema::TYPE_BOOLEAN . ' COMMENT "Флаг включения услуги в стоимость размещения"',
            'price' => Schema::TYPE_DECIMAL . '(10,2) COMMENT "Стоимость услуги"',
            'include' => 'tinyint(1) NOT NULL DEFAULT 0',
        ]);
        $this->addForeignKey('fk_room_service_room_id__room_id', 'room_service', 'room_id', 'room', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk_room_service_service_id__additional_service_id', 'room_service', 'service_id', 'additional_service', 'id', 'CASCADE', 'CASCADE');
        $this->createIndex('uidx_room_service_room_service', 'room_service', 'room_id, service_id', true);
    }

    public function down()
    {
        $this->dropForeignKey("fk_room_service_service_id__additional_service_id", "room_service");
        $this->dropForeignKey("fk_room_service_room_id__room_id", "room_service");
        $this->dropTable('room_service');
    }

}
