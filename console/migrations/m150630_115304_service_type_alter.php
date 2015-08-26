<?php

use yii\db\Schema;
use yii\db\Migration;

class m150630_115304_service_type_alter extends Migration
{
    public function up()
    {
        $this->dropIndex('uidx_service_type_name', 'service_type');
        $this->createIndex('uidx_service_type_name_category', 'service_type', 'name, category_id', true);
    }

    public function down()
    {
        echo "m150630_115304_service_type_alter cannot be reverted.\n";

        return false;
    }
    
    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }
    
    public function safeDown()
    {
    }
    */
}
