<?php

use yii\db\Schema;
use yii\db\Migration;
use modules\directory\models\ServiceCategory;
use modules\directory\models\ServiceType;
class m150630_092650_tour_group extends Migration
{
    public function up()
    {
	    $vals = ['Обязательные','Транспорт','Экскурсии', 'Мероприятия'];
	    foreach ($vals as $val) {
		    if (!ServiceType::find()->where(['name' => $val, 'category_id' => ServiceCategory::CATEGORY_TOUR])->one()) {
			    $this->insert('service_type', ['name' => $val, 'category_id' => ServiceCategory::CATEGORY_TOUR]);
		    }
	    }
}

    public function down()
    {
        echo "m150630_092650_tour_group cannot be reverted.\n";

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
