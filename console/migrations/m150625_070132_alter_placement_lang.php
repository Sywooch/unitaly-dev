<?php

use yii\db\Schema;
use yii\db\Migration;

class m150625_070132_alter_placement_lang extends Migration
{
    public function up()
    {
        $this->addColumn('placement_lang', 'desc', 'varchar(4096)');
        $this->addColumn('placement', 'desc', 'integer');
    }

    public function down()
    {
        $this->dropColumn('placement_lang', 'desc');
        $this->dropColumn('placement', 'desc');
    }

}
