<?php

use yii\db\Schema;
use yii\db\Migration;

class m150624_133020_create_placement_service extends Migration
{
    public function up()
    {
        $this->createTable('placement_service', [
            'id' => 'pk',
            'placement_id' => Schema::TYPE_INTEGER .' NOT NULL',
            'service_id' => Schema::TYPE_INTEGER .' NOT NULL',
            'active' => Schema::TYPE_BOOLEAN . ' COMMENT "Флаг включения услуги в стоимость размещения"',
            'price' => Schema::TYPE_DECIMAL . '(10,2) COMMENT "Стоимость услуги"',
            'include' => 'tinyint(1) NOT NULL DEFAULT 0',
        ]);
        $this->addForeignKey('fk_placement_service_placement_id__placement_id', 'placement_service', 'placement_id', 'placement', 'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('fk_placement_service_service_id__additional_service_id', 'placement_service', 'service_id', 'additional_service', 'id', 'CASCADE', 'CASCADE');
        $this->createIndex('uidx_placement_service_placement_service', 'placement_service', 'placement_id, service_id', true);
    }

    public function down()
    {
        $this->dropForeignKey("fk_placement_service_service_id__additional_service_id", "placement_service");
        $this->dropForeignKey("fk_placement_service_placement_id__placement_id", "placement_service");
        $this->dropTable('placement_service');
    }

}
