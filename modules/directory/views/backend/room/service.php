<?php

use yii\bootstrap\Html;
use yii\helpers\Url;
use kartik\nav\NavX;
use kartik\grid\GridView;
use yii\grid\CheckboxColumn;
use kartik\switchinput\SwitchInput;
use kartik\form\ActiveForm;
use kartik\builder\TabularForm;
use modules\directory\Module as DirectoryModule;
use vova07\themes\admin\widgets\Box;

$this->title = DirectoryModule::t('room', 'BACKEND_INDEX_TITLE');
$this->params['subtitle'] = DirectoryModule::t('room', 'BACKEND_SERVICE_SUBTITLE');
$this->params['breadcrumbs'] = [
    [
        'label' => $this->title,
        'url' => ['index'],
    ],
    $this->params['subtitle']
];
?>
<div class="row">
    <div class="col-xs-12">
    <?php
    $boxButtons[] = '{cancel}';
    $boxButtons = !empty($boxButtons) ? implode(' ', $boxButtons) : null;
    $buttons['cancel'] = [
        'url' => ['room/index'],
        'icon' => 'fa-reply',
        'options' => [
            'class' => 'btn-default',
            'title' => Yii::t('vova07/themes/admin/widgets/box', 'Cancel')
        ]
    ];
    Box::begin(
        [
            'title' => $this->params['subtitle'],
            'options' => [
                'class' => 'box-primary'
            ],
            'bodyOptions' => [
                'class' => 'table-responsive'
            ],
            'buttonsTemplate' => $boxButtons,
            'buttons' => $buttons,
        ]
    );
    $items = [];
    foreach($types as $type){
        $item = [
            'label' => $type->name,
            'url' => Url::toRoute(['service', 'type'=>$type->id, 'roomId'=>$roomId]),
            'active' => $type->id == $curTypeId,
        ];
        $items[] = $item;
    }

    echo NavX::widget([
        'options'=>['class'=>'nav nav-pills'],
        'items' => $items
    ]);

    $form = ActiveForm::begin();

    $attribs = [
        'id'=>[
            'type'=>TabularForm::INPUT_RAW,
            'columnOptions'=>['hidden'=>true],
            'value' => function ($model, $key, $index, $widget) use($roomId){
                $model->roomId = $roomId;
            }
        ],
        'roomActive' => [
            'type' => TabularForm::INPUT_CHECKBOX,
        ],
        'name'=>[
            'type'=>TabularForm::INPUT_STATIC
        ],
        'roomInclude' => [
            'type'=>TabularForm::INPUT_WIDGET,
            'widgetClass'=>SwitchInput::classname(),
        ],
        'roomPrice'=>[
            'type'=>TabularForm::INPUT_TEXT,
        ],
    ];

    echo TabularForm::widget([
        'dataProvider'=>$dataProvider,
        'form'=>$form,
        'attributes'=>$attribs,
        'actionColumn'=>false,
        'checkboxColumn'=>false,
        'gridSettings'=>[
            'floatHeader'=>true,
            'panel'=>[
    //            'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-book"></i> '.DirectoryModule::t('room', 'BACKEND_SERVICE_TITLE').'</h3>',
                'type' => GridView::TYPE_PRIMARY,
                'after'=> Html::submitButton('<i class="glyphicon glyphicon-floppy-disk"></i> '.DirectoryModule::t('room', 'BACKEND_UPDATE_SUBMIT'), ['class'=>'btn btn-primary'])
            ]
        ]
    ]);
    ActiveForm::end();
    ?>
    </div>
</div>