<?php

use yii\db\Schema;
use yii\db\Migration;

class m150625_105436_alter_placement_add_stars extends Migration
{
    public function up()
    {
        $this->addColumn('placement', 'stars', 'integer');
    }

    public function down()
    {
        $this->dropColumn('placement', 'stars');
    }

}
