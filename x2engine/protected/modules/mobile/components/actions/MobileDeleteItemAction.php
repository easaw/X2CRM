<?php
/***********************************************************************************
 * X2CRM is a customer relationship management program developed by
 * X2Engine, Inc. Copyright (C) 2011-2016 X2Engine Inc.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY X2ENGINE, X2ENGINE DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 * 
 * You can contact X2Engine, Inc. P.O. Box 66752, Scotts Valley,
 * California 95067, USA. on our website at www.x2crm.com, or at our
 * email address: contact@x2engine.com.
 * 
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 * 
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * X2Engine" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by X2Engine".
 **********************************************************************************/

/*
 * Action that deletes an Action History item
 */
class MobileDeleteItemAction extends MobileAction {
    
    public function run ($id) {
        parent::beforeRun ();
            
        $model = $this->controller->loadModel ($id);
        $modelClass = $this->controller->modelClass;
        $authParams['X2Model'] = $model;
        if ($this->controller->checkPermissions($model, 'delete') && 
            $model instanceof X2Model &&
            $this->controller->hasMobileAction ('mobileDelete') &&
            Yii::app()->user->checkAccess(ucfirst ($this->controller->module->name).'Delete', $authParams)) {
                if ($model->delete ()) {
                    Yii::app()->user->setFlash ('success', Yii::t('app', 'Record deleted')); 
                    // X2TODO: ajax call to re-render action history list after deletion of an action
                    $this->controller->render (
                        'application.modules.mobile.views.mobile.recordView',
                        array (
                            'model' => $model,
                        )
                    );
                } else {
                    throw new CHttpException (500, Yii::t('app', 'Failed to delete record.'));
                }
        } else {
            $this->controller->denied ();
        }
    }

}

?>