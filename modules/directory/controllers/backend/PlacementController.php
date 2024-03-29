<?php

namespace modules\directory\controllers\backend;

use common\actions\CreateAction;
use common\actions\DeleteAction;
use common\actions\UpdateAction;
use modules\base\behaviors\LangSaveBehavior;
use modules\base\widgets\alphabet\AlphabetListView;
use modules\directory\models\Placement;
use modules\directory\models\form\PlacementForm;
use modules\directory\models\form\PlacementServiceForm;
use modules\directory\models\PlacementLang;
use modules\directory\Module;
use modules\translations\models\Lang;
use vova07\users\models\User;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\helpers\VarDumper;
use yii\web\UploadedFile;
use yii\filters\VerbFilter;
use modules\directory\models\City;
use yii\db\ActiveRecord;
use modules\directory\models\search\PlacementSearch;
use modules\directory\models\Province;
use modules\directory\models\Hub;
use modules\directory\models\search\TourSearch;
use modules\directory\models\search\PlacementServiceSearch;
use modules\directory\models\ServiceType;
use modules\directory\models\PlacementService;


class PlacementController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        $behaviors = parent::behaviors();

        $behaviors['access']['rules'][] = [
            'allow' => true,
            'actions' => ['index'],
            'roles' => ['BViewPlacement']
        ];
        $behaviors['access']['rules'][] = [
            'allow' => true,
            'actions' => ['create'],
            'roles' => ['BCreatePlacement']
        ];
        $behaviors['access']['rules'][] = [
            'allow' => true,
            'actions' => ['update'],
            'roles' => ['BUpdatePlacement']
        ];
        $behaviors['access']['rules'][] = [
            'allow' => true,
            'actions' => ['delete'],
            'roles' => ['BDeletePlacement']
        ];
        $behaviors['verbs'] = [
            'class' => VerbFilter::className(),
            'actions' => [
                'index' => ['get'],
                'create' => ['get', 'post'],
                'update' => ['get', 'put', 'post'],
                'delete' => ['post', 'delete'],
            ]
        ];

        return $behaviors;
    }

    public function actions()
    {
        return [
            'create' => [
                'class' => CreateAction::className(),
                'modelClass' => Placement::className(),
                'formModelClass' => PlacementForm::className(),
                'ajaxValidation' => true,
                'redirectUrl' => Url::toRoute('index'),
                'afterAction' => function($action, $model, $formModel) {
                    return $this->afterEdit($action, $model, $formModel);
                }
            ],
            'update' => [
                'class' => UpdateAction::className(),
                'modelClass' => Placement::className(),
                'formModelClass' => PlacementForm::className(),
                'redirectUrl' => Url::toRoute('index'),
                'ajaxValidation' => true,
                'beforeAction' => function($model, $formModel) {
                    $formModel->add_image = $model->addImage;
                    $formModel->logo_image = $model->logoImage;

                    $city = City::findOne($formModel->city_id);
                    if($city){
                        $formModel->province_id = $city->province_id;
                        $province = Province::findOne($city->province_id);
                        $formModel->region_id = $province->region_id;
                    }

                    $languages = Lang::find()->all();
                    $placementLangs = $model->placementLangs;
                    $placementLangs = ArrayHelper::index($placementLangs, 'lang_id');
                    foreach($languages as $language){
                        $placementLang = isset($placementLangs[$language->id]) ? $placementLangs[$language->id] : new PlacementLang();
                        $formModel->translationName[$language->id] = $placementLang->name;
                        $formModel->translationDesc[$language->id] = $placementLang->desc;
                    }

                    return $formModel;
                },
                'afterAction' => function($action, $model, $formModel){
                    return $this->afterEdit($action, $model, $formModel);
                }
            ],
            'delete' => [
                'class' => DeleteAction::className(),
                'modelClass' => Placement::className(),
                'redirectUrl' => Url::toRoute(['index']),
            ],
        ];
    }

    /**
     * Index
     */
    public function actionIndex($q=null)
    {
        $searchModel = new PlacementSearch();

        $dataProvider = $searchModel->search(\Yii::$app->request->get());
        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'searchModel' => $searchModel,
        ]);
    }

    /**
     * After edit
     */
    public function afterEdit($action, $model, $formModel)
    {
        $formModel->logo_image = UploadedFile::getInstance($formModel, 'logo_image');
        if ($image = $formModel->getImage('logo_image')) {
            $model->logo_image_id = $image->id;
            $model->save();
        }
        $formModel->add_image = UploadedFile::getInstance($formModel, 'add_image');
        if ($image = $formModel->getImage('add_image')) {
            $model->add_image_id = $image->id;
            $model->save();
        }

        $model->saveLangsRelations('placementLangs', $formModel, 'translationName', 'name', 'placement_id');
        $model->saveLangsRelations('placementLangs', $formModel, 'translationDesc', 'desc', 'placement_id');
        $model->trigger(ActiveRecord::EVENT_AFTER_FIND);
        $firstLetter = mb_substr($model->name,0,1,'utf-8');
        $action->redirectUrl = Url::toRoute(['index', 'q'=>$firstLetter]);
        return $model;
    }

    /**
     * Hubinfo
     */
    public function actionHubinfo($hub_id = null){
        if ($hub = Hub::findOne($hub_id)) {
            echo $this->renderAjax('_hub', ['hub' => $hub]);
        } else {

        }
    }

    public function actionService($placementId){
        $types = ServiceType::find()->placement()->all();

        $curTypeId = \Yii::$app->getRequest()->get('type');
        reset($types);
        if(!$curTypeId && $curType = current($types)){
            $curTypeId = $curType->id;
        }

        $model = new PlacementServiceForm();
        $model->serviceTypeId = $curTypeId;
        $model->placementId = $placementId;
        $serviceDataProvider = $model->search();

        if($post = \Yii::$app->request->post('PlacementServiceSearch')){
            $count = 0;
            foreach($post as $service_id=>$attrs){
                $ts = PlacementService::find()->where([
                    'placement_id' => $placementId,
                    'service_id' => $service_id
                ])->one();
                $ts = $ts ? $ts : new PlacementService();
                $ts->placement_id = $placementId;
                $ts->service_id = $service_id;
                $ts->include = $post[$service_id]['placementInclude'];
                $ts->price = $post[$service_id]['placementPrice'];
                $ts->active = $post[$service_id]['placementActive'];
                if($ts->load($attrs, '')){
                    if ($ts->save()) {
                        $count++;
                    }
                }
            }
//            \Yii::$app->session->setFlash('success', "Processed {$count} records successfully.");
//            return $this->redirect(['index']); // redirect to your next desired page
        }
        return $this->render('service', [
            'placementId' => $placementId,
            'types' => $types,
            'curTypeId' => $curTypeId,
            'dataProvider' => $serviceDataProvider,
        ]);
    }

}